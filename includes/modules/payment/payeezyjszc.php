<?php
/**
 * Payeezy payment module
 *
 * Payeezy does token-based transactions, to avoid the risks of onsite handling of card data, thereby not interfering with PCI Compliance.
 * The customer stays on-site but card-processing is done remotely over secure channels, preventing any unnecessary processing of sensitive data.
 *
 * NOTE: You will need TransArmor enabled on your merchant account to do token based transactions.
 * Contact your merchant account representative for more details on how to enable this or call 1-855-799-0790.
 * For merchants domiciled outside the U.S. please contact your local technical support team for assistance with preparing your account to work with Payeezy JS and Token-Based transactions.
 *
 * For configuration instructions see: https://github.com/zencart/payeezyjs/blob/master/README.md
 *
 * REQUIRES PHP 5.4 or newer
 *
 * @package payeezy
 * @copyright Copyright 2003-2019 Zen Cart Development Team
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: DrByte 2019 Jan 04 Modified in v1.5.6a $
 */

// required to prevent PHP 5.3 from throwing errors:
if (!defined('JSON_UNESCAPED_SLASHES')) define('JSON_UNESCAPED_SLASHES', 64);
if (!defined('JSON_UNESCAPED_UNICODE')) define('JSON_UNESCAPED_UNICODE', 256);


/**
 * Payeezy Payment module class
 */
class payeezyjszc extends base
{
    /**
     * $code determines the internal 'code' name used to designate "this" payment module
     *
     * @var string
     */
    var $code;
    /**
     * $moduleVersion is the plugin version number
     */
    var $moduleVersion = '0.99';
    /**
     * $title is the displayed name for this payment method
     *
     * @var string
     */
    var $title;
    /**
     * $description is admin-display details for this payment method
     *
     * @var string
     */
    var $description;
    /**
     * $enabled determines whether this module shows or not... in catalog.
     *
     * @var boolean
     */
    var $enabled;
    /**
     * $sort_order determines the display-order of this module to customers
     */
    var $sort_order;
    /**
     * $commError and $commErrNo are CURL communication error details for debug purposes
     */
    var $commError, $commErrNo;
    /**
     * transaction vars hold the IDs of the completed payment
     */
    var $transaction_id, $transaction_messages, $auth_code;
    /**
     * internal vars
     */
    private $avs_codes, $cvv_codes, $mode;
    /**
     * Advanced setting to enable expedited processing
     */
    private $etppid = 'a77026b9457c8cf77ac73268ce5873cb02f41c0413f1f43d';


    /**
     * Constructor
     */
    function __construct()
    {
        global $order;

        $this->code  = 'payeezyjszc';
        $this->title = MODULE_PAYMENT_PAYEEZYJSZC_TEXT_CATALOG_TITLE; // Payment module title in Catalog
        if (IS_ADMIN_FLAG === true) {
            $this->title = MODULE_PAYMENT_PAYEEZYJSZC_TEXT_ADMIN_TITLE;
            if (defined('MODULE_PAYMENT_PAYEEZYJSZC_STATUS')) {
                if (MODULE_PAYMENT_PAYEEZYJSZC_API_SECRET == '') {
                    $this->title .= '<span class="alert"> (not configured; API details needed)</span>';
                }
                if ($this->mode == 'Sandbox') {
                    $this->title .= '<span class="alert"> (Sandbox mode)</span>';
                }
                $new_version_details = plugin_version_check_for_updates(2050, $this->moduleVersion);
                if ($new_version_details !== false) {
                    $this->title .= '<span class="alert">' . ' - NOTE: A NEW VERSION OF THIS PLUGIN IS AVAILABLE. <a href="' . $new_version_details['link'] . '" target="_blank">[Details]</a>' . '</span>';
                }
            }
        }

        $this->description = 'PayeezyJS ' . $this->moduleVersion . '<br>' . MODULE_PAYMENT_PAYEEZYJSZC_TEXT_DESCRIPTION;
        $this->enabled     = (defined('MODULE_PAYMENT_PAYEEZYJSZC_STATUS') && MODULE_PAYMENT_PAYEEZYJSZC_STATUS == 'True');
        $this->sort_order  = defined('MODULE_PAYMENT_PAYEEZYJSZC_SORT_ORDER') ? MODULE_PAYMENT_PAYEEZYJSZC_SORT_ORDER : null;

        if (null === $this->sort_order) return false;

        $this->mode  = MODULE_PAYMENT_PAYEEZYJSZC_TESTING_MODE;

        // determine order-status for transactions
        if ((int)MODULE_PAYMENT_PAYEEZYJSZC_ORDER_STATUS_ID > 0) {
            $this->order_status = MODULE_PAYMENT_PAYEEZYJSZC_ORDER_STATUS_ID;
        }
        // Reset order status to pending if capture pending:
        if (MODULE_PAYMENT_PAYEEZYJSZC_TRANSACTION_TYPE == 'authorize') {
            $this->order_status = 1;
        }

        $this->_logDir = DIR_FS_LOGS;

        // check for zone compliance and any other conditionals
        if (is_object($order)) {
            $this->update_status();
        }

        $this->setAvsCvvMeanings();
    }


    function update_status()
    {
        global $order, $db;
        if ($this->enabled == false || (int)MODULE_PAYMENT_PAYEEZYJSZC_ZONE == 0) {
            return;
        }
        if (isset($order->billing['country']) && isset($order->billing['country']['id'])) {
            $check_flag = false;
            $sql        = "SELECT zone_id FROM " . TABLE_ZONES_TO_GEO_ZONES . " WHERE geo_zone_id = '" . (int)MODULE_PAYMENT_PAYEEZYJSZC_ZONE . "' AND zone_country_id = '" . (int)$order->billing['country']['id'] . "' ORDER BY zone_id";
            $checks     = $db->Execute($sql);
            foreach ($checks as $check) {
                if ($check['zone_id'] < 1) {
                    $check_flag = true;
                    break;
                } elseif ($check['zone_id'] == $order->billing['zone_id']) {
                    $check_flag = true;
                    break;
                }
            }
            if ($check_flag == false) {
                $this->enabled = false;
            }
        }
    }

    function javascript_validation()
    {
        return '';
    }

    function selection()
    {
        global $order;

        // Payeezy currently only accepts  "American Express", "Visa", "Mastercard", "Discover", "JCB", "Diners Club"
        $cc_types = array();
        if (CC_ENABLED_VISA == 1) {
            $cc_types[] = array('id' => 'Visa', 'text' => 'Visa');
        }
        if (CC_ENABLED_MC == 1) {
            $cc_types[] = array('id' => 'Mastercard', 'text' => 'Mastercard');
        }
        if (CC_ENABLED_DISCOVER == 1) {
            $cc_types[] = array('id' => 'Discover', 'text' => 'Discover');
        }
        if (CC_ENABLED_AMEX == 1) {
            $cc_types[] = array('id' => 'American Express', 'text' => 'American Express');
        }
        if (CC_ENABLED_JCB == 1) {
            $cc_types[] = array('id' => 'JCB', 'text' => 'JCB');
        }
        if (CC_ENABLED_DINERS_CLUB == 1) {
            $cc_types[] = array('id' => 'Diners Club', 'text' => 'Diners Club');
        }

        // Prepare selection of expiry dates
        for ($i = 1; $i < 13; $i++) {
            $expires_month[] = array('id' => sprintf('%02d', $i), 'text' => strftime('%B - (%m)', mktime(0, 0, 0, $i, 1, 2000)));
        }
        $today = getdate();
        for ($i = $today['year']; $i < $today['year'] + 15; $i++) {
            $expires_year[] = array('id' => strftime('%y', mktime(0, 0, 0, 1, 1, $i)), 'text' => strftime('%Y', mktime(0, 0, 0, 1, 1, $i)));
        }

        // helper for auto-selecting the radio-button next to this module so the user doesn't have to make that choice
        $onFocus = ' onfocus="methodSelect(\'pmt-' . $this->code . '\')"';

        $selection = array(
            'id'     => $this->code,
            'module' => MODULE_PAYMENT_PAYEEZYJSZC_TEXT_CATALOG_TITLE,
            'fields' => array(
                array(
                    'title' => MODULE_PAYMENT_PAYEEZYJSZC_TEXT_CREDIT_CARD_TYPE,
                    'field' => zen_draw_pull_down_menu($this->code . '_cc_type', $cc_types, '',
                        'payeezy-data="card_type" id="' . $this->code . '_cc-type"' . $onFocus . ' autocomplete="off"'),
                    'tag'   => $this->code . '_cc-type',
                ),
                array(
                    'title' => MODULE_PAYMENT_PAYEEZYJSZC_TEXT_CREDIT_CARD_OWNER,
                    'field' => zen_draw_input_field($this->code . '_cc_owner',
                        $order->billing['firstname'] . ' ' . $order->billing['lastname'],
                        'payeezy-data="cardholder_name" id="' . $this->code . '_cc-owner"' . $onFocus . ' autocomplete="off"'),
                    'tag'   => $this->code . '_cc-owner',
                ),
                array(
                    'title' => MODULE_PAYMENT_PAYEEZYJSZC_TEXT_CREDIT_CARD_NUMBER,
                    'field' => '<input type="text" payeezy-data="cc_number" id="' . $this->code . '_cc-number"' . $onFocus . ' autocomplete="off">',
                    'tag'   => $this->code . '_cc-number',
                ),
                array(
                    'title' => MODULE_PAYMENT_PAYEEZYJSZC_TEXT_CREDIT_CARD_EXPIRES,
                    'field' => zen_draw_pull_down_menu($this->code . '_cc_expires_month', $expires_month, strftime('%m'), 'payeezy-data="exp_month" id="' . $this->code . '_cc-expires-month"' . $onFocus) . '&nbsp;' .
                        zen_draw_pull_down_menu($this->code . '_cc_expires_year', $expires_year, '', 'payeezy-data="exp_year" id="' . $this->code . '_cc-expires-year"' . $onFocus),
                    'tag'   => $this->code . '_cc-expires-month',
                ),
                array(
                    'title' => MODULE_PAYMENT_PAYEEZYJSZC_TEXT_CVV,
                    'field' => '<input type="number" size="4" maxlength="4" payeezy-data="cvv_code" id="' . $this->code . '_cc-cvv"' . $onFocus . ' autocomplete="off">',
                    'tag'   => $this->code . '_cc-cvv',
                ),
                array(
                    'title' => '',
                    'field' => zen_draw_hidden_field($this->code . '_fdtoken', '', 'id="' . $this->code . '_fdtoken"') . '<div id="payeezy-payment-errors"></div>' .
                        zen_draw_hidden_field($this->code . '_cc_number', '', 'id="' . $this->code . '_cc_number') .
                        zen_draw_hidden_field($this->code . '_currency', $order->info['currency'], 'payeezy-data="currency"') .
                        zen_draw_hidden_field($this->code . '_billing_street', $order->billing['street_address'], 'payeezy-data="billing.street"') .
                        zen_draw_hidden_field($this->code . '_billing_city', $order->billing['city'], 'payeezy-data="billing.city"') .
                        zen_draw_hidden_field($this->code . '_billing_state', zen_get_zone_code($order->billing['country']['id'], $order->billing['zone_id'], $order->billing['state']), 'payeezy-data="billing.state"') .
                        zen_draw_hidden_field($this->code . '_billing_country', $order->billing['country']['iso_code_2'], 'payeezy-data="billing.country"') .
                        zen_draw_hidden_field($this->code . '_billing_zip', $order->billing['postcode'], 'payeezy-data="billing.zip"') .
                        zen_draw_hidden_field($this->code . '_billing_email', $order->customer['email_address'], 'payeezy-data="billing.email"') .
                        zen_draw_hidden_field($this->code . '_billing_phone', $order->customer['telephone'], 'payeezy-data="billing.phone"'),
                    'tag'   => '',
                ),
            ),
        );

        return $selection;
    }

    function pre_confirmation_check()
    {
        global $messageStack;
        if (!isset($_POST[$this->code . '_fdtoken']) || trim($_POST[$this->code . '_fdtoken']) == '') {
            $messageStack->add_session('checkout_payment', MODULE_PAYMENT_PAYEEZYJSZC_ERROR_MISSING_FDTOKEN, 'error');
            zen_redirect(zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL', true, false));
        }
    }

    function confirmation()
    {
        $confirmation =array(
            'fields' =>array(
               array(
                    'title' => MODULE_PAYMENT_PAYEEZYJSZC_TEXT_CREDIT_CARD_TYPE,
                    'field' => zen_output_string_protected($_POST[$this->code . '_cc_type']),
                ),
               array(
                    'title' => MODULE_PAYMENT_PAYEEZYJSZC_TEXT_CREDIT_CARD_OWNER,
                    'field' => zen_output_string_protected($_POST[$this->code . '_cc_owner']),
                ),
               array(
                    'title' => MODULE_PAYMENT_PAYEEZYJSZC_TEXT_CREDIT_CARD_NUMBER,
                    'field' => zen_output_string_protected($_POST[$this->code . '_cc_number']),
                ),
               array(
                    'title' => MODULE_PAYMENT_PAYEEZYJSZC_TEXT_CREDIT_CARD_EXPIRES,
                    'field' => strftime('%B, %Y', mktime(0, 0, 0, $_POST[$this->code . '_cc_expires_month'], 1, '20' . $_POST[$this->code . '_cc_expires_year'])),
                ),
            ),
        );

        return $confirmation;
    }

    function process_button()
    {
        $process_button_string = zen_draw_hidden_field($this->code . '_fdtoken', $_POST[$this->code . '_fdtoken']);
        $process_button_string .= zen_draw_hidden_field('cc_owner', zen_output_string_protected($_POST[$this->code . '_cc_owner']));
        $process_button_string .= zen_draw_hidden_field('cc_type', zen_output_string_protected($_POST[$this->code . '_cc_type']));
        $process_button_string .= zen_draw_hidden_field('cc_number', zen_output_string_protected($_POST[$this->code . '_cc_number']));
        $process_button_string .= zen_draw_hidden_field('cc_cvv', preg_replace('/[^0-9]/', '', $_POST[$this->code . '_cc_cvv']));
        $process_button_string .= zen_draw_hidden_field('cc_expires', preg_replace('/[^0-9]/', '', $_POST[$this->code . '_cc_expires_month']) . (int)$_POST[$this->code . '_cc_expires_year']);

        return $process_button_string;
    }

    function before_process()
    {
        global $messageStack, $order, $order_totals;

        if (!isset($_POST[$this->code . '_fdtoken']) || trim($_POST[$this->code . '_fdtoken']) == '') {
            $messageStack->add_session('checkout_payment', MODULE_PAYMENT_PAYEEZYJSZC_ERROR_MISSING_FDTOKEN, 'error');
            zen_redirect(zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL', true, false));
        }

        $order->info['cc_owner']  = $_POST['cc_owner'];
        $order->info['cc_type']   = $_POST['cc_type'];
        $order->info['cc_number'] = $_POST['cc_number'];
        if (!strpos($order->info['cc_number'], 'XX')) {
            $order->info['cc_number'] = str_pad(substr($_POST['cc_number'], -4), strlen($_POST['cc_number']), "X", STR_PAD_LEFT);
        }
        $order->info['cc_expires'] = '';
        $order->info['cc_cvv']     = '***';

        // lookup shipping and discount amounts
        $args['x_freight'] = $args['x_tax'] = $args['discount_amount'] = 0;
        if (count($order_totals)) {
            for ($i = 0, $n = count($order_totals); $i < $n; $i++) {
                if ($order_totals[$i]['code'] == '') {
                    continue;
                }
                if (in_array($order_totals[$i]['code'],array('ot_total', 'ot_subtotal', 'ot_tax', 'ot_shipping', 'insurance'))) {
                    if ($order_totals[$i]['code'] == 'ot_shipping') {
                        $args['x_freight'] = round($order_totals[$i]['value'], 2);
                    }
                    if ($order_totals[$i]['code'] == 'ot_tax') {
                        $args['x_tax'] = round($order_totals[$i]['value'], 2);
                    }
                } else {
                    // handle credits
                    global ${$order_totals[$i]['code']};
                    if ((substr($order_totals[$i]['text'], 0, 1) == '-') || (isset(${$order_totals[$i]['code']}->credit_class) && ${$order_totals[$i]['code']}->credit_class == true)) {
                        $args['discount_amount'] += round($order_totals[$i]['value'], 2);
                    }
                }
            }
        }


        // @TODO - consider converting currencies if the gateway requires
        $exchange_factor = 1;


// sandbox testing
// $payment_amount = 520200;

        // prepare data for submission
        $payload = array();

        $payload['merchant_ref']     = substr(bin2hex(openssl_random_pseudo_bytes(64)), 0, 20);
        $payload['transaction_type'] = MODULE_PAYMENT_PAYEEZYJSZC_TRANSACTION_TYPE;
        $payload['method']           = 'token';
        $payload['amount']           = (int)$this->format_amount_for_payeezy($order->info['total']);
        $payload['currency_code']    = strtoupper($order->info['currency']);
        $payload['token']            = array('token_type' => 'FDToken');

        $payload['token']['token_data']['value']           = preg_replace('/[^0-9a-z\-]/i', '', $_POST[$this->code . '_fdtoken']);
        $payload['token']['token_data']['cardholder_name'] = htmlentities($order->info['cc_owner']);
        $payload['token']['token_data']['exp_date']        = str_pad(preg_replace('/[^0-9]/', '', $_POST['cc_expires']), 4, '0', STR_PAD_LEFT); // ensure month is 2 digits
        $payload['token']['token_data']['cvv']             = (string)(preg_replace('/[^0-9]/', '', $_POST['cc_cvv']));
        $payload['token']['token_data']['type']            = preg_replace('/[^a-z ]/i', '', $_POST['cc_type']);

        if (MODULE_PAYMENT_PAYEEZYJSZC_SEND_SOFT_DESCRIPTORS == 'Yes') {
            $payload['soft_descriptors'] = array(
                'dba_name'              => STORE_NAME, // recommended max 22 chars
                // 'street' => '',
                'city'                  => preg_replace('~https?://~', '', HTTP_SERVER), // for ecommerce sites they suggest using the site URL here
                // 'region' => '',
                // 'mid' => '',
                // 'mcc' => '',
                'postal_code'           => SHIPPING_ORIGIN_ZIP,
                // 'country_code' => '',
                'merchant_contact_info' => STORE_TELEPHONE_CUSTSERVICE,
            );
        }

        $payload['billing_address'] = array(
            'name'            => $order->billing['firstname'] . ' ' . $order->billing['lastname'],
            'street'          => $order->billing['street_address'],
            'city'            => $order->billing['city'],
            'state_province'  => $order->billing['state'],
            'zip_postal_code' => $order->billing['postcode'],
            'country'         => $order->billing['country']['title'],
            'email'           => $order->customer['email_address'],
            'phone'           => array('type' => 'D', 'number' => $order->customer['telephone']),
        );

        if (MODULE_PAYMENT_PAYEEZYJSZC_SEND_LEVEL2 == 'Yes') {
            $payload['level2'] = array(
                'tax1_amount'  => $this->format_amount_for_payeezy($args['x_tax']),
                // 'tax1_number'=> '',  // number of the tax type, per the API chart
                // 'tax2_amount'=> $this->format_amount_for_payeezy($args['x_tax2']),
                // 'tax2_number'=> '',  // number of the tax type, per the API chart
                'customer_ref' => $_SESSION['customer_id'],  // customer number, or PO number, or invoice number, or order number
            );
        }

        if (MODULE_PAYMENT_PAYEEZYJSZC_SEND_LEVEL3 == 'Yes') {
            $payload['level3'] = array(
                'alt_tax_amount'  => 0,
                'alt_tax_id'      => 0,
                'discount_amount' => $this->format_amount_for_payeezy($args['discount_amount']),
                // 'duty_amount'=> 0,
                'freight_amount'  => $this->format_amount_for_payeezy($args['x_freight']),
                'ship_from_zip'   => SHIPPING_ORIGIN_ZIP,
                'ship_to_address' => array(
                    'customer_number' => $_SESSION['customer_id'],
                    'address_1'       => $order->delivery['street_address'],
                    'city'            => $order->delivery['city'],
                    'state'           => $order->delivery['state'],
                    'zip'             => $order->delivery['postcode'],
                    'country'         => $order->delivery['country']['title'],
                    'email'           => $order->customer['email_address'],
                    'name'            => $order->delivery['firstname'] . ' ' . $order->delivery['lastname'],
                    'phone'           => $order->customer['telephone'],
                ),
            );

            // Add line-item data to transaction payload
            if (count($order->products) < 100) {
                $product_code = $commodity_code = ''; // not submitted

                $payload['level3']['line_items'] = array();
                foreach ($order->products as $p) {
                    $payload['level3']['line_items'][] = (object)array(
                        'description'     => $p['name'],
                        'quantity'        => $p['qty'],
                        // 'commodity_code'=> $commodity_code,
                        // 'discount_amount'=> '',
                        // 'discount_indicator'=> '',
                        // 'gross_net_indicator'=> '',
                        'line_item_total' => $this->format_amount_for_payeezy(round(zen_add_tax($p['final_price'] * $exchange_factor, $p['tax']) * $p['qty'], 2)),
                        // 'product_code'=> $product_code,
                        'tax_amount'      => $this->format_amount_for_payeezy(round(zen_calculate_tax($p['final_price'] * $exchange_factor, $p['tax']), 2)),
                        'tax_rate'        => round($p['tax'], 8),
                        // 'tax_type'=> '',
                        'unit_cost'       => $this->format_amount_for_payeezy(round($p['final_price'] * $exchange_factor, 2)),
                        // 'unit_of_measure'=> '',
                    );
                }
            }
        }

// FOR TROUBLESHOOTING ONLY
// TO TEMPORARILY DISABLE TRANSMISSION OF soft_descriptors OR level 2/3 data, UNCOMMENT THE FOLLOWING LINES:
        //    unset($payload['soft_descriptors']);
        //    unset($payload['level2']);
        //    unset($payload['level3']);
        //    unset($payload['billing_address']);


        $payload_logged = $payload;
        $payload        = json_encode($payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

        // submit transaction
        $response = $this->postTransaction($payload, $this->hmacAuthorizationToken($payload));

        // log the response data
        $this->logTransactionData($response, $payload_logged);



        // analyze the response

        // http_codes:
        // 200, 201, 202 - OK
        // 400 = bad request, therefore did not complete
        // 401 = unauthorized = invalid API key and token
        // 403 = unauthorized = bad hmac verification
        // 404 = requested resource did not exist
        // 500, 502, 503, 504 = server error on Payeezy end

        // transaction_status:
        // Approved = Card Approved
        // Declined = Gateway declined
        // Not Processed = For any internal errors this status is returned.

        // validation_status: values - “success” / ”failure” based on input validation

        // transaction_id and transaction_tag (auth code) -- are used for follow-on processing such as recurring billing, void/capture/refund, etc


        // failed
        if ($response['http_code'] == 400) {
            $messageStack->add_session('checkout_payment', MODULE_PAYMENT_PAYEEZYJSZC_TEXT_ERROR . '[' . zen_output_string_protected($response['Error']['messages'][0]['description']) . ']', 'error');
            zen_redirect(zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL', true, false));

            // error example:
            // {"correlation_id":"228.1454542837160",
            // "Error":
            //   {"messages":[
            //     {"code":"invalid_card_type",
            //      "description":"The card type is invalid"}
            //      ]
            //   },
            // "transaction_status":"Not Processed",
            // "validation_status":"failed",

        }

        // invalid API key and token
        if ($response['http_code'] == 401) {
            $messageStack->add_session('checkout_payment', MODULE_PAYMENT_PAYEEZYJSZC_TEXT_MISCONFIGURATION . 'PAYEEZY-401-BAD-API-TOKEN', 'error');
            zen_redirect(zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL', true, false));
        }

        if ($response['http_code'] == 403) {
            $messageStack->add_session('checkout_payment', MODULE_PAYMENT_PAYEEZYJSZC_TEXT_MISCONFIGURATION . 'PAYEEZY-403-BAD-HMAC', 'error');
            zen_redirect(zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL', true, false));
        }

        // bad transaction call
        if ($response['http_code'] == 404) {
            $messageStack->add_session('checkout_payment', MODULE_PAYMENT_PAYEEZYJSZC_TEXT_MISCONFIGURATION . 'PAYEEZY-404-FAILED-SEE-LOGS', 'error');
            zen_redirect(zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL', true, false));
        }

        // error at Payeezy. Call tech support
        if (in_array($response['http_code'], array(500, 502, 503, 504))) {
            $messageStack->add_session('checkout_payment', MODULE_PAYMENT_PAYEEZYJSZC_TEXT_MISCONFIGURATION . 'PAYEEZY-500-CALL_TECH_SUPPORT', 'error');
            zen_redirect(zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL', true, false));
        }





        // successful submission; now need to ensure it was not declined
        if (in_array($response['http_code'], array(200, 201, 202))) {
            // success example:
            // {"correlation_id":"228.1100035528625",
            // "transaction_status":"approved",
            // "validation_status":"success",
            // "transaction_type":"purchase",
            // "transaction_id":"ET159009",
            // "transaction_tag":"74080064",
            // "method":"token",
            // "amount":"200",
            // "currency":"USD",
            // "cvv2":"I",
            // "token":{"token_type":"FDToken",
            //   "token_data":{"type":"Mastercard",
            //   "cardholder_name":"xyz",
            //   "exp_date":"0430",
            //   "value":"2833693200041732"}
            // },
            // "bank_resp_code":"100",
            // "bank_message":"Approved",
            // "gateway_resp_code":"00",
            // "gateway_message":"Transaction Normal"}

            if ($response['transaction_status'] == 'approved') {
                $this->auth_code            = $response['transaction_tag'];
                $this->transaction_id       = $response['transaction_id'] . ' Auth/Tag: ' . $response['transaction_tag'] . ' Amount: ' . number_format($response['amount'] / 100, 2, '.', '');
                $this->transaction_messages = $response['bank_resp_code'] . ' ' . $response['bank_message'] . ' ' . $response['gateway_resp_code'] . ' ' . $response['gateway_message'];
                if (isset($response['avs']) && isset($this->avs_codes[$response['avs']])) {
                    $this->transaction_messages .= "\n" . 'AVS: ' . $this->avs_codes[$response['avs']];
                }
                if (isset($response['cvv2']) && isset($this->cvv_codes[$response['cvv2']])) {
                    $this->transaction_messages .= "\n" . 'CVV: ' . $this->cvv_codes[$response['cvv2']];
                }

                return true;
            }

            if ($response['transaction_status'] == 'declined') {

                // 238 = invalid currency
                // 243 = invalid Level 3 data, or card not suited for Level 3
                // 258 = soft_descriptors not allowed/configured on this merchant account
                // 260 = AVS - Authorization network could not reach the bank which issued the card
                // 264 = Duplicate transaction; rejected.
                // 301 = Issuer Unavailable. Try again.
                // 303 = (Generic) Processor Decline: no other explanation offered
                // 351, 353, 354 = Transarmor errors

                // 301 means timeout, try again, because Authorization network could not reach the bank which issued the card
                // if ($response['bank_resp_code'] == 301) {
                //     $response = $this->postTransaction($payload, $this->hmacAuthorizationToken($payload));
                //     $this->logTransactionData($response, $payload_logged);
                // }

                // check for soft-descriptor failure, and resubmit without
                if ($response['bank_resp_code'] == 258 && MODULE_PAYMENT_PAYEEZYJSZC_SEND_SOFT_DESCRIPTORS == 'Yes') {
                    $payload = $payload_logged;
                    unset($payload['soft_descriptors']);
                    $payload_logged = $payload;
                    $payload = json_encode($payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
                    $response = $this->postTransaction($payload, $this->hmacAuthorizationToken($payload));
                    $this->logTransactionData($response, $payload_logged);
                    if (in_array($response['http_code'], array(200, 201, 202)) && $response['transaction_status'] == 'approved') {
                        $this->auth_code            = $response['transaction_tag'];
                        $this->transaction_id       = $response['transaction_id'] . ' Auth/Tag: ' . $response['transaction_tag'] . ' Amount: ' . number_format($response['amount'] / 100, 2, '.', '');
                        $this->transaction_messages = $response['bank_resp_code'] . ' ' . $response['bank_message'] . ' ' . $response['gateway_resp_code'] . ' ' . $response['gateway_message'];
                        if (isset($response['avs']) && isset($this->avs_codes[$response['avs']])) {
                            $this->transaction_messages .= "\n" . 'AVS: ' . $this->avs_codes[$response['avs']];
                        }
                        if (isset($response['cvv2']) && isset($this->cvv_codes[$response['cvv2']])) {
                            $this->transaction_messages .= "\n" . 'CVV: ' . $this->cvv_codes[$response['cvv2']];
                        }

                        return true;
                    }
                }

                // check for level 3 failure, and resubmit without
                if ($response['bank_resp_code'] == 243 && MODULE_PAYMENT_PAYEEZYJSZC_SEND_LEVEL3 == 'Yes') {
                    $payload = $payload_logged;
                    unset($payload['level3']);
                    $payload_logged = $payload;
                    $payload = json_encode($payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
                    $response = $this->postTransaction($payload, $this->hmacAuthorizationToken($payload));
                    $this->logTransactionData($response, $payload_logged);
                    if (in_array($response['http_code'], array(200, 201, 202)) && $response['transaction_status'] == 'approved') {
                        $this->auth_code            = $response['transaction_tag'];
                        $this->transaction_id       = $response['transaction_id'] . ' Auth/Tag: ' . $response['transaction_tag'] . ' Amount: ' . number_format($response['amount'] / 100, 2, '.', '');
                        $this->transaction_messages = $response['bank_resp_code'] . ' ' . $response['bank_message'] . ' ' . $response['gateway_resp_code'] . ' ' . $response['gateway_message'];
                        if (isset($response['avs']) && isset($this->avs_codes[$response['avs']])) {
                            $this->transaction_messages .= "\n" . 'AVS: ' . $this->avs_codes[$response['avs']];
                        }
                        if (isset($response['cvv2']) && isset($this->cvv_codes[$response['cvv2']])) {
                            $this->transaction_messages .= "\n" . 'CVV: ' . $this->cvv_codes[$response['cvv2']];
                        }

                        return true;
                    }
                }


                // check if card is flagged for fraud
                if (in_array($response['bank_resp_code'], array(500, 501, 502, 503, 596, 534, 524, 519))) {
                    global $zco_notifier;
                    $_SESSION['payment_attempt'] = 500;
                    $zco_notifier->notify('NOTIFY_CHECKOUT_SLAMMING_LOCKOUT', $response);
                    $_SESSION['cart']->reset(true);
                    zen_session_destroy();
                    $messageStack->add_session('checkout_payment', MODULE_PAYMENT_PAYEEZYJSZC_ERROR_DECLINED, 'error');
                    zen_redirect(zen_href_link(FILENAME_TIME_OUT));
                }

                // generic "declined" message response
                $messageStack->add_session('checkout_payment', MODULE_PAYMENT_PAYEEZYJSZC_ERROR_DECLINED, 'error');
                zen_redirect(zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL', true, false));
            }

            // Should never get here if we have a 200-204 response; if we get here, the transaction could not be processed for some other reason
            $messageStack->add_session('checkout_payment', MODULE_PAYMENT_PAYEEZYJSZC_TEXT_ERROR . '[' . zen_output_string_protected($response['bank_resp_code'] . '/' . $response['gateway_resp_code']) . ']', 'error');
            zen_redirect(zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL', true, false));
        }




        // communications/CURL error
        if ($this->commError != '') {
            $messageStack->add_session('checkout_payment', MODULE_PAYMENT_PAYEEZYJSZC_TEXT_COMM_ERROR . ' (' . $this->commErrNo . ')', 'caution');
            zen_redirect(zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL', true, false));
        }

        // should never get here
        $messageStack->add_session('checkout_payment', MODULE_PAYMENT_PAYEEZYJSZC_TEXT_ERROR . '[PAYEEZY-GENERAL-FAILURE]', 'error');
        zen_redirect(zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL', true, false));
    }

    /**
     * Post-process activities. Updates the order-status history data with the auth code from the transaction.
     *
     * @return boolean
     */
    function after_process()
    {
        global $insert_id, $db, $order;
        $sql = "insert into " . TABLE_ORDERS_STATUS_HISTORY . " (comments, orders_id, orders_status_id, customer_notified, date_added) values (:orderComments, :orderID, :orderStatus, -1, now() )";
        $sql = $db->bindVars($sql, ':orderComments', 'Credit Card payment.  TransID: ' . $this->transaction_id . ' - ' . $this->transaction_messages, 'string');
        $sql = $db->bindVars($sql, ':orderID', $insert_id, 'integer');
        $sql = $db->bindVars($sql, ':orderStatus', $this->order_status, 'integer');
        $db->Execute($sql);

        return true;
    }


    function check()
    {
        global $db;
        if (!isset($this->_check)) {
            $check_query  = $db->Execute("select configuration_value from " . TABLE_CONFIGURATION . " where configuration_key = 'MODULE_PAYMENT_PAYEEZYJSZC_STATUS'");
            $this->_check = $check_query->RecordCount();
        }
        // if module is already installed, then we can call install() to update any missing/new keys
        if ($this->_check) {
            $this->install();
        }

        return $this->_check;
    }

    /**
     * install/update configuration keys for this module
     */
    function install()
    {
        global $db;
        // NOTE: each of these tests for its own defined key before inserting.
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_STATUS')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Payeezy JS Module', 'MODULE_PAYMENT_PAYEEZYJSZC_STATUS', 'True', 'Do you want to accept Payeezy (First Data) payments?', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_SORT_ORDER')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort order of display.', 'MODULE_PAYMENT_PAYEEZYJSZC_SORT_ORDER', '0', 'Sort order of displaying payment options to the customer. Lowest is displayed first.', '6', '0', now())");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_ZONE')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) values ('Payment Zone', 'MODULE_PAYMENT_PAYEEZYJSZC_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', '6', '2', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(', now())");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_ORDER_STATUS_ID')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) values ('Set Order Status', 'MODULE_PAYMENT_PAYEEZYJSZC_ORDER_STATUS_ID', '2', 'Set the status of orders made with this payment module to this value', '6', '0', 'zen_cfg_pull_down_order_statuses(', 'zen_get_order_status_name', now())");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_TRANSACTION_TYPE')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Transaction Type', 'MODULE_PAYMENT_PAYEEZYJSZC_TRANSACTION_TYPE', 'purchase', 'Should payments be [authorized] only, or be completed [purchases]?', '6', '0', 'zen_cfg_select_option(array(\'authorize\', \'purchase\'), ', now())");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_API_KEY')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function) values ('API Key', 'MODULE_PAYMENT_PAYEEZYJSZC_API_KEY', '', 'Enter the API Key assigned to your account', '6', '0',  now(), 'zen_cfg_password_display')");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_API_SECRET')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function) values ('API Secret', 'MODULE_PAYMENT_PAYEEZYJSZC_API_SECRET', '', 'Enter the API Secret assigned to your account', '6', '0',  now(), 'zen_cfg_password_display')");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_MERCHANT_TOKEN')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function) values ('Merchant Token - Live', 'MODULE_PAYMENT_PAYEEZYJSZC_MERCHANT_TOKEN', '', 'Enter the [Live] Merchant Token from your account settings', '6', '0',  now(), 'zen_cfg_password_display')");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_JSSECURITY_KEY')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function) values ('JS Security Key - Live', 'MODULE_PAYMENT_PAYEEZYJSZC_JSSECURITY_KEY', '', 'Enter the [Live] JS Security key from your account settings', '6', '0',  now(), 'zen_cfg_password_display')");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_API_KEY_SANDBOX')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function) values ('API Key - Sandbox (optional)', 'MODULE_PAYMENT_PAYEEZYJSZC_API_KEY_SANDBOX', '', 'Enter the [Sandbox/Demo] API Key assigned to your account', '6', '0',  now(), 'zen_cfg_password_display')");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_API_SECRET_SANDBOX')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function) values ('API Secret - Sandbox (optional)', 'MODULE_PAYMENT_PAYEEZYJSZC_API_SECRET_SANDBOX', '', 'Enter the [Sandbox/Demo] API Secret assigned to your account', '6', '0',  now(), 'zen_cfg_password_display')");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_MERCHANT_TOKEN_SANDBOX')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function) values ('Merchant Token - Sandbox (optional)', 'MODULE_PAYMENT_PAYEEZYJSZC_MERCHANT_TOKEN_SANDBOX', '', 'Enter the [Sandbox/Demo] Merchant Token from your account settings', '6', '0',  now(), 'zen_cfg_password_display')");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_JSSECURITY_KEY_SANDBOX')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function) values ('JS Security Key - Sandbox (optional)', 'MODULE_PAYMENT_PAYEEZYJSZC_JSSECURITY_KEY_SANDBOX', '', 'Enter the [Sandbox/Demo] JS Security key from your account settings', '6', '0',  now(), 'zen_cfg_password_display')");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_TATOKEN')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function) values ('Trans Armor Token', 'MODULE_PAYMENT_PAYEEZYJSZC_TATOKEN', '', 'Enter the TA Token from your GGe4 account settings (non-US merchants can leave this blank).<br><br>For US Merchants the TransArmor token can be obtained by logging in to https://globalgatewaye4.firstdata.com, navigating to the Terminals page and selecting your terminal. If the Transarmor token is blank, it means that your account has not been enabled for Transarmor yet. To enable Transarmor for your account, you will need to reach out to your account representative or call 1-855-799-0790', '6', '0',  now(), 'zen_cfg_password_display')");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_SEND_SOFT_DESCRIPTORS')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Send Soft Descriptor Data', 'MODULE_PAYMENT_PAYEEZYJSZC_SEND_SOFT_DESCRIPTORS', 'No', 'Soft-Descriptor data is typically used to differentiate between multiple stores in one merchant account, by sending the store-name and other data in each transaction. The feature must be enabled in your Merchant Account.', '6', '0', 'zen_cfg_select_option(array(\'Yes\', \'No\'), ', now())");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_SEND_LEVEL2')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Send Level II Card Data', 'MODULE_PAYMENT_PAYEEZYJSZC_SEND_LEVEL2', 'No', 'Level II data includes extra tax information, and is usually related to government-issued cards. The feature must be enabled in your Merchant Account.', '6', '0', 'zen_cfg_select_option(array(\'Yes\', \'No\'), ', now())");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_SEND_LEVEL3')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Send Level III Card Data', 'MODULE_PAYMENT_PAYEEZYJSZC_SEND_LEVEL3', 'No', 'Level III data includes detailed transaction line-items, and is usually related to government-issued cards. Using the feature can often result in reduced fees. The feature must be enabled in your Merchant Account.', '6', '0', 'zen_cfg_select_option(array(\'Yes\', \'No\'), ', now())");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_TESTING_MODE')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Sandbox/Live Mode', 'MODULE_PAYMENT_PAYEEZYJSZC_TESTING_MODE', 'Live', 'Use [Live] for real transactions<br>Use [Sandbox] for developer testing', '6', '0', 'zen_cfg_select_option(array(\'Live\', \'Sandbox\'), ', now())");
        }
        if (!defined('MODULE_PAYMENT_PAYEEZYJSZC_LOGGING')) {
            $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Log Mode', 'MODULE_PAYMENT_PAYEEZYJSZC_LOGGING', 'Log on Failures and Email on Failures', 'Would you like to enable debug mode?  A complete detailed log of failed transactions may be emailed to the store owner.', '6', '0', 'zen_cfg_select_option(array(\'Off\', \'Log Always\', \'Log on Failures\', \'Log Always and Email on Failures\', \'Log on Failures and Email on Failures\', \'Email Always\', \'Email on Failures\'), ', now())");
        }
    }

    function remove()
    {
        global $db;
        $db->Execute("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
    }

    function keys()
    {
        return array(
            'MODULE_PAYMENT_PAYEEZYJSZC_STATUS',
            'MODULE_PAYMENT_PAYEEZYJSZC_SORT_ORDER',
            'MODULE_PAYMENT_PAYEEZYJSZC_ZONE',
            'MODULE_PAYMENT_PAYEEZYJSZC_TRANSACTION_TYPE',
            'MODULE_PAYMENT_PAYEEZYJSZC_ORDER_STATUS_ID',
            'MODULE_PAYMENT_PAYEEZYJSZC_API_KEY',
            'MODULE_PAYMENT_PAYEEZYJSZC_API_SECRET',
            'MODULE_PAYMENT_PAYEEZYJSZC_MERCHANT_TOKEN',
            'MODULE_PAYMENT_PAYEEZYJSZC_JSSECURITY_KEY',
            'MODULE_PAYMENT_PAYEEZYJSZC_TATOKEN',
            'MODULE_PAYMENT_PAYEEZYJSZC_SEND_SOFT_DESCRIPTORS',
            'MODULE_PAYMENT_PAYEEZYJSZC_SEND_LEVEL2',
            'MODULE_PAYMENT_PAYEEZYJSZC_SEND_LEVEL3',
            'MODULE_PAYMENT_PAYEEZYJSZC_TESTING_MODE',
            'MODULE_PAYMENT_PAYEEZYJSZC_API_KEY_SANDBOX',
            'MODULE_PAYMENT_PAYEEZYJSZC_API_SECRET_SANDBOX',
            'MODULE_PAYMENT_PAYEEZYJSZC_MERCHANT_TOKEN_SANDBOX',
            'MODULE_PAYMENT_PAYEEZYJSZC_JSSECURITY_KEY_SANDBOX',
            'MODULE_PAYMENT_PAYEEZYJSZC_LOGGING',
        );
    }

    private function format_amount_for_payeezy($amount)
    {
        global $currencies, $order;
        $decimal_places = 2;
        if (isset($order) && isset($order->info['currency'])) {
            $decimal_places = $currencies->get_decimal_places($order->info['currency']);
        }
        if ((int)$decimal_places === 0) return (int)$amount;

        // older way
        return (int)(string)(round($amount, $decimal_places) * pow(10, $decimal_places));

        // Requires PHP 5.6 or newer:
//        return (int)(string)(round($amount, $decimal_places) * 10 ** $decimal_places);
    }

    private function hmacAuthorizationToken($payload)
    {
        $nonce         = (string)(hexdec(bin2hex(openssl_random_pseudo_bytes(4, $cstrong))));
        $timestamp     = sprintf('%s', (string)(time()) . '000'); //time stamp in milli seconds as string
        $data          = (string)(constant('MODULE_PAYMENT_PAYEEZYJSZC_API_KEY' . ($this->mode == 'Sandbox' ? '_SANDBOX' : ''))) . $nonce . $timestamp . (string)(constant('MODULE_PAYMENT_PAYEEZYJSZC_MERCHANT_TOKEN' . ($this->mode == 'Sandbox' ? '_SANDBOX' : ''))) . $this->etppid . $payload;
        $hashAlgorithm = "sha256";
        $hmac          = hash_hmac($hashAlgorithm, $data, (string)(constant('MODULE_PAYMENT_PAYEEZYJSZC_API_SECRET' . ($this->mode == 'Sandbox' ? '_SANDBOX' : ''))), false);    // HMAC Hash in hex
        $authorization = base64_encode($hmac);

        return array(
            'authorization' => $authorization,
            'nonce'         => $nonce,
            'timestamp'     => $timestamp,
        );
    }

    private function postTransaction($payload, $headers)
    {
        $endpoint    = $this->mode == 'Sandbox' ? 'api-cert.payeezy.com' : 'api.payeezy.com';
        $curlHeaders = array(
            'Content-Type: application/json',
            'apikey:' . (string)(constant('MODULE_PAYMENT_PAYEEZYJSZC_API_KEY' . ($this->mode == 'Sandbox' ? '_SANDBOX' : ''))),
            'token:' . (string)(constant('MODULE_PAYMENT_PAYEEZYJSZC_MERCHANT_TOKEN' . ($this->mode == 'Sandbox' ? '_SANDBOX' : ''))),
            'Authorization:' . $headers['authorization'],
            'nonce:' . $headers['nonce'],
            'timestamp:' . (string)($headers['timestamp']),
            'ext_tppid:' . $this->etppid,
        );
        $request     = curl_init();
        curl_setopt($request, CURLOPT_URL, "https://" . $endpoint . "/v1/transactions");
        curl_setopt($request, CURLOPT_POST, true);
        curl_setopt($request, CURLOPT_POSTFIELDS, $payload);
        curl_setopt($request, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($request, CURLOPT_HEADER, false);
        curl_setopt($request, CURLOPT_HTTPHEADER, $curlHeaders);
        $response = curl_exec($request);

        $commErrNo = curl_errno($request);
        if ($commErrNo == 35) {
            trigger_error('ALERT: Could not process Payeezy transaction via normal CURL communications. Your server is encountering connection problems using TLS 1.2 ... because your hosting company cannot autonegotiate a secure protocol with modern security protocols. We will try the transaction again, but this is resulting in a very long delay for your customers, and could result in them attempting duplicate purchases. Get your hosting company to update their TLS capabilities ASAP.',
                E_USER_NOTICE);
            // Reset CURL to TLS 1.2 using the defined value of 6 instead of CURL_SSLVERSION_TLSv1_2 since these outdated hosts also don't properly implement this constant either.
            curl_setopt($request, CURLOPT_SSLVERSION, 6);
            // and attempt resubmit
            $response = curl_exec($request);
        }

        if (false === $response) {
            $this->commError = curl_error($request);
            $this->commErrNo = curl_errno($request);
            trigger_error('Payeezy communications failure. ' . $this->commErrNo . ' - ' . $this->commError, E_USER_NOTICE);
        }
        $httpcode       = curl_getinfo($request, CURLINFO_HTTP_CODE);
        $this->commInfo = curl_getinfo($request);
        curl_close($request);

        if (!in_array($httpcode, array(200, 201, 202))) {
            error_log($response);
        }

        $response                = json_decode($response, true);
        $response['http_code']   = $httpcode;
        $response['curlHeaders'] = $curlHeaders;

        return $response;
    }

    /**
     * Log transaction errors if enabled
     */
    private function logTransactionData($response, $payload)
    {
        global $db;

        // Don't log headers if we get a success response
        if (substr($response['http_code'], 0, 2) == '20') {
            unset($response['curlHeaders']);
        }

        $logMessage = date('M-d-Y h:i:s') . ' ' . $this->code . ' ' . $this->moduleVersion .
            "\n=====================================\n\n" .
            ($this->commError != '' ? 'Comm results: ' . $this->commErrNo . ' ' . $this->commError . "\n\n" : '') .
            'Transaction Status: ' . $response['transaction_status'] . "\n" .
            'Bank Message: ' . $response['bank_message'] . "\n" .
            'HTTP Response Code: ' . $response['http_code'] . "\n\n" .
            'Sent to Payeezy: ' . str_replace($_POST['cc_cvv'], '***', print_r($payload, true)) . "\n\n" .
            'Results Received back from Payeezy: ' . print_r($response, true) . "\n\n" .
            'CURL communication info: ' . print_r($this->commInfo, true) . "\n";

        if (strstr(MODULE_PAYMENT_PAYEEZYJSZC_LOGGING, 'Log Always') || ($response['transaction_status'] != 'approved' && strstr(MODULE_PAYMENT_PAYEEZYJSZC_LOGGING, 'Log on Failures'))) {
            $key  = $response['transaction_id'] . '_' . preg_replace('/[^a-z]/i', '', $response['transaction_status']) . '_' . time() . '_' . zen_create_random_value(4);
            $file = $this->_logDir . '/' . 'Payeezy_' . $key . '.log';
            if ($fp = @fopen($file, 'a')) {
                fwrite($fp, $logMessage);
                fclose($fp);
            }
        }
        if (($response['transaction_status'] != 'approved' && stristr(MODULE_PAYMENT_PAYEEZYJSZC_LOGGING, 'Email on Failures')) || strstr(MODULE_PAYMENT_PAYEEZYJSZC_LOGGING, 'Email Always')) {
            zen_mail(STORE_NAME, STORE_OWNER_EMAIL_ADDRESS, 'Payeezy Alert ' . $response['transaction_status'] . ' ' . date('M-d-Y h:i:s'), $logMessage, STORE_OWNER, STORE_OWNER_EMAIL_ADDRESS,
                array('EMAIL_MESSAGE_HTML' => nl2br($logMessage)), 'debug');
        }
    }

    private function setAvsCvvMeanings()
    {
        $this->cvv_codes['M'] = 'CVV2/CVC2 Match - Indicates that the card is authentic. Complete the transaction if the authorization request was approved.';
        $this->cvv_codes['N'] = 'CVV2 / CVC2 No Match – May indicate a problem with the card. Contact the cardholder to verify the CVV2 code before completing the transaction, even if the authorization request was approved.';
        $this->cvv_codes['P'] = 'Not Processed - Indicates that the expiration date was not provided with the request, or that the card does not have a valid CVV2 code. If the expiration date was not included with the request, resubmit the request with the expiration date.';
        $this->cvv_codes['S'] = 'Merchant Has Indicated that CVV2 / CVC2 is not present on card - May indicate a problem with the card. Contact the cardholder to verify the CVV2 code before completing the transaction.';
        $this->cvv_codes['U'] = 'Issuer is not certified and/or has not provided visa encryption keys';
        $this->cvv_codes['I'] = 'CVV2 code is invalid or empty';

        $this->avs_codes['X'] = 'Exact match, 9 digit zip - Street Address, and 9 digit ZIP Code match';
        $this->avs_codes['Y'] = 'Exact match, 5 digit zip - Street Address, and 5 digit ZIP Code match';
        $this->avs_codes['A'] = 'Partial match - Street Address matches, ZIP Code does not';
        $this->avs_codes['W'] = 'Partial match - ZIP Code matches, Street Address does not';
        $this->avs_codes['Z'] = 'Partial match - 5 digit ZIP Code match only';
        $this->avs_codes['N'] = 'No match - No Address or ZIP Code match';
        $this->avs_codes['U'] = 'Unavailable - Address information is unavailable for that account number, or the card issuer does not support';
        $this->avs_codes['G'] = 'Service Not supported, non-US Issuer does not participate';
        $this->avs_codes['R'] = 'Retry - Issuer system unavailable, retry later';
        $this->avs_codes['E'] = 'Not a mail or phone order';
        $this->avs_codes['S'] = 'Service not supported';
        $this->avs_codes['Q'] = 'Bill to address did not pass edit checks/Card Association cannot verify the authentication of an address';
        $this->avs_codes['D'] = 'International street address and postal code match';
        $this->avs_codes['B'] = 'International street address match, postal code not verified due to incompatible formats';
        $this->avs_codes['C'] = 'International street address and postal code not verified due to incompatible formats';
        $this->avs_codes['P'] = 'International postal code match, street address not verified due to incompatible format';
        $this->avs_codes['1'] = 'Cardholder name matches';
        $this->avs_codes['2'] = 'Cardholder name, billing address, and postal code match';
        $this->avs_codes['3'] = 'Cardholder name and billing postal code match';
        $this->avs_codes['4'] = 'Cardholder name and billing address match';
        $this->avs_codes['5'] = 'Cardholder name incorrect, billing address and postal code match';
        $this->avs_codes['6'] = 'Cardholder name incorrect, billing postal code matches';
        $this->avs_codes['7'] = 'Cardholder name incorrect, billing address matches';
        $this->avs_codes['8'] = 'Cardholder name, billing address, and postal code are all incorrect';
        $this->avs_codes['F'] = 'Address and Postal Code match (UK only)';
        $this->avs_codes['I'] = 'Address information not verified for international transaction';
        $this->avs_codes['M'] = 'Address and Postal Code match';
    }

}

// for backward compatibility with older ZC versions before v152 which didn't have this function:
if (!function_exists('plugin_version_check_for_updates')) {
  function plugin_version_check_for_updates($plugin_file_id = 0, $version_string_to_compare = '', $strict_zc_version_compare = false)
  {
    if ($plugin_file_id == 0) return false;
    $new_version_available = false;
    $lookup_index = $errno = 0;
    $response = $error = '';
    $url1 = 'https://plugins.zen-cart.com/versioncheck/'.(int)$plugin_file_id;
    $url2 = 'https://www.zen-cart.com/versioncheck/'.(int)$plugin_file_id;

    if (function_exists('curl_init')) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$url1);
        curl_setopt($ch, CURLOPT_VERBOSE, 0);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_TIMEOUT, 9);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 9);
        curl_setopt($ch, CURLOPT_USERAGENT, 'Plugin Version Check [' . (int)$plugin_file_id . '] ' . HTTP_SERVER);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($ch);
        $error = curl_error($ch);
        $errno = curl_errno($ch);

        if ($errno > 0) {
          trigger_error('CURL error checking plugin versions: ' . $errno . ':' . $error . "\nTrying http instead.");
          curl_setopt($ch, CURLOPT_URL, str_replace('tps:', 'tp:', $url1));
          $response = curl_exec($ch);
          $error = curl_error($ch);
          $errno = curl_errno($ch);
        }
        if ($errno > 0) {
          trigger_error('CURL error checking plugin versions: ' . $errno . ':' . $error . "\nTrying www instead.");
          curl_setopt($ch, CURLOPT_URL, str_replace('tps:', 'tp:', $url2));
          $response = curl_exec($ch);
          $error = curl_error($ch);
          $errno = curl_errno($ch);
        }
        curl_close($ch);
    } else {
        $errno = 9999;
        $error = 'curl_init not found in PHP';
    }
    if ($errno > 0 || $response == '') {
      trigger_error('CURL error checking plugin versions: ' . $errno . ':' . $error . "\nTrying file_get_contents() instead.");
      $ctx = stream_context_create(array('http' => array('timeout' => 5)));
      $response = file_get_contents($url1, null, $ctx);
      if ($response === false) {
        trigger_error('file_get_contents() error checking plugin versions.' . "\nTrying http instead.");
        $response = file_get_contents(str_replace('tps:', 'tp:', $url1), null, $ctx);
      }
      if ($response === false) {
        trigger_error('file_get_contents() error checking plugin versions.' . "\nAborting.");
        return false;
      }
    }

    $data = json_decode($response, true);
    if (!$data || !is_array($data)) return false;
    // compare versions
    if (strcmp($data[$lookup_index]['latest_plugin_version'], $version_string_to_compare) > 0) $new_version_available = true;
    // check whether present ZC version is compatible with the latest available plugin version
    $zc_version = PROJECT_VERSION_MAJOR . '.' . preg_replace('/[^0-9.]/', '', PROJECT_VERSION_MINOR);
    if ($strict_zc_version_compare) $zc_version = PROJECT_VERSION_MAJOR . '.' . PROJECT_VERSION_MINOR;
    if (!in_array('v'. $zc_version, $data[$lookup_index]['zcversions'])) $new_version_available = false;
    return ($new_version_available) ? $data[$lookup_index] : false;
  }
}
