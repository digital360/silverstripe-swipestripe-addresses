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
				<h3><strong><% _t('CheckoutPage.STEP1', 'Step 1 of 5:') %></strong> <% _t('CheckoutPage.SHIPPING_ADDRESS', 'Shipping Address') %></h3>
				<% loop ShippingAddressFields %>
					$FieldHolder
				<% end_loop %>
			</div>
		</section>

		<hr />
	
		<section class="address">
			<div id="address-billing">
				<h3><strong><% _t('CheckoutPage.STEP2', 'Step 2 of 5:') %></strong> <% _t('CheckoutPage.BILLINGADDRESS', 'Billing Address') %></h3>
				<% loop BillingAddressFields %>
					$FieldHolder
				<% end_loop %>
			</div>
		</section>
		
		<hr />
		
		<section class="order-details">
			<h3><strong><% _t('CheckoutPage.STEP3', 'Step 3 of 5:') %></strong> <% _t('CheckoutPage.REVIEW', 'Your Order') %></h3>

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
			<h3><b><% _t('CheckoutPage.STEP4', 'Step 4 of 5:') %></b> <% _t('CheckoutPage.ACCOUNT', 'Create Account') %></h3>
			<div class="alert alert-info">By creating an account you can log in and check your order status. You can also use this account next time to save time in the checkout.</div>
		
			<% loop PersonalDetailsFields %>
				$FieldHolder
			<% end_loop %>
		</section>
		
		<hr />
		<% end_if %>

		<section class="payment-details">
			<h3><b><% _t('CheckoutPage.STEP5', 'Step 5 of 5:') %></b> <% _t('CheckoutPage.PAYMENT', 'Payment Method') %></h3>
			<% loop PaymentFields %>
				$FieldHolder
			<% end_loop %>
			<div class="loader"></div>
		</section>

		<div class="clear" />
	</fieldset>

	<% if Cart.Items %>
		<% if Actions %>
		<div class="Actions">
			<% loop Actions %>
				$Field
			<% end_loop %>
		</div>
		<% end_if %>
	<% end_if %>
	
<% if IncludeFormTag %>
</form>
<% end_if %>