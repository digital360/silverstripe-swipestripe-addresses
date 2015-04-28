<% if IncludeFormTag %>
<form $FormAttributes>
<% end_if %>

	<% if Message %>
		<div id="{$FormName}_error" class="message error $MessageType">
			<p>We could not process the order because:</p>
			<p>$Message</p>
		</div>
	<% else %>
		<p id="{$FormName}_error" class="message $MessageType" style="display: none"></p>
	<% end_if %>

	<fieldset>

		<% if LoginFields %>
		<section class="login-details">
			<% loop LoginFields %>
				$FieldHolder
			<% end_loop %>
		</section>
		
		<% end_if %>

		<section class="address">
			<div id="address-shipping">
				<h3><strong>Step 1 of <% if PersonalDetailsFields %>5<% else %>4<% end_if %>:</strong> <% _t('CheckoutPage.SHIPPING_ADDRESS', 'Shipping Address') %></h3>
				<% loop ShippingAddressFields %>
					$FieldHolder
				<% end_loop %>
			</div>
		</section>

		<hr />
	
		<section class="address">
			<div id="address-billing">
				<h3><strong>Step 2 of <% if PersonalDetailsFields %>5<% else %>4<% end_if %>:</strong> <% _t('CheckoutPage.BILLINGADDRESS', 'Billing Address') %></h3>
				<% loop BillingAddressFields %>
					$FieldHolder
				<% end_loop %>
			</div>
		</section>
		
		<hr />
		
		<section class="order-details">
			<h3><strong>Step 3 of <% if PersonalDetailsFields %>5<% else %>4<% end_if %>: </strong> <% _t('CheckoutPage.REVIEW', 'Your Order') %></h3>

			<div id="cart-loading-js" class="cart-loading">
				<div>
					<h4>Loading...</h4>
				</div>
			</div>
			
			<% include OrderFormCart %>
		</section>
	 

		<section class="notes">
			<% loop NotesFields %>
				$FieldHolder
			<% end_loop %>
		</section>
		
		<hr />

		<% if PersonalDetailsFields %>
		<section class="personal-details">
			<h3><strong>Step 4 of 5:</strong> <% _t('CheckoutPage.ACCOUNT', 'Create Account') %></h3>
			<div class="alert alert-info">By creating an account you can log in and check your order status. You can also use this account next time to save time in the checkout.</div>
		
			<% loop PersonalDetailsFields %>
				$FieldHolder
			<% end_loop %>
		</section>
		
		<hr />
		<% end_if %>

		<section class="payment-details">
			<h3><strong><% if PersonalDetailsFields %>Step 5 of 5:<% else %>Step 4 of 4:<% end_if %></strong> <% _t('CheckoutPage.PAYMENT', 'Payment Method') %></h3>
			<img src="data:image/jpg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAAA8AAD/4QN5aHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjMtYzAxMSA2Ni4xNDU2NjEsIDIwMTIvMDIvMDYtMTQ6NTY6MjcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6NWQ4NzYzOTgtZjY2MC00MzBiLTlkY2ItMjY3YzkxN2YxYTgxIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkQ5NjdBRDA0RTRDODExRTRBQzAwQTUxNTlCODQxMkZEIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkQ5NjdBRDAzRTRDODExRTRBQzAwQTUxNTlCODQxMkZEIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE0IChNYWNpbnRvc2gpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RDVEODdDODdCM0Q4MTFFNDkzQ0VDNEUxNTgxNzY3NzYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RDVEODdDODhCM0Q4MTFFNDkzQ0VDNEUxNTgxNzY3NzYiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRm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"/>
			<% loop PaymentFields %>
				$FieldHolder
			<% end_loop %>
			<div class="loader"></div>
		</section>

		<div class="clear" />
	</fieldset>

	<hr>

	<% if Cart.Items %>
		<% if Actions %>
		<div class="Actions">
			<% loop Actions %>
				$Field
			<% end_loop %>
		</div>
		<% end_if %>
	<% end_if %>
	<div class="privacy-notice"><img class="padlock" src="data:image/jpg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAAA8AAD/4QN5aHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjMtYzAxMSA2Ni4xNDU2NjEsIDIwMTIvMDIvMDYtMTQ6NTY6MjcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6NWQ4NzYzOTgtZjY2MC00MzBiLTlkY2ItMjY3YzkxN2YxYTgxIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkQ5NjdBRDA4RTRDODExRTRBQzAwQTUxNTlCODQxMkZEIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkQ5NjdBRDA3RTRDODExRTRBQzAwQTUxNTlCODQxMkZEIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE0IChNYWNpbnRvc2gpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6RDVEODdDODdCM0Q4MTFFNDkzQ0VDNEUxNTgxNzY3NzYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6RDVEODdDODhCM0Q4MTFFNDkzQ0VDNEUxNTgxNzY3NzYiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAAGBAQEBQQGBQUGCQYFBgkLCAYGCAsMCgoLCgoMEAwMDAwMDBAMDg8QDw4MExMUFBMTHBsbGxwfHx8fHx8fHx8fAQcHBw0MDRgQEBgaFREVGh8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx//wAARCAAjABkDAREAAhEBAxEB/8QAdgABAAIDAQAAAAAAAAAAAAAABgIFAAQHCAEBAQEAAAAAAAAAAAAAAAAAAAECEAABAgMEBgQPAAAAAAAAAAABAgMAEQQhEhQFMUFRcSITkTIkBmGBocHRUmKiM5M0ZFUWFxEBAQEAAAAAAAAAAAAAAAAAAAER/9oADAMBAAIRAxEAPwD0znObIy5hBCC7UPrSzTspIBW4sySmZsG86oCDdJna0X3qptDhtLTaFFIOy+VAnfdEBmW5m47VPUNUkIq2OsBoIImCDrBFo8sBZwAvM85oqzvdkCqR9upo0rcW682oLbT2aoSCVCzrKSPHALF5hQoE1voSNpUIAjVZ1Sf0KnWl9GCFEi++FDlhYNRNJVomJp6YBN+w5D+Qpvmo9MMHLe4y1ooaYhRTwi0GUWoY5w/2UFSieHfEUFerGucoTOnZGozVfjWPD0RRs9xqkv0NIoC6m4JJiKc5z9ImfqxlXP3pc5dmuNxmq2zZAbHcPEYGmuc+7dEuXybsp6r/ABS3xFOc4xuEE8X1deF80QBHsTzl/H0/bxYlR4fY96A//9k="/> {$SiteConfig.PrivacyText}</div>
<% if IncludeFormTag %>
</form>
<% end_if %>
<%-- eWay crypt --%>
<script src="https://secure.ewaypayments.com/scripts/eCrypt.js"></script>