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

		<section class="address">
			<div id="address-shipping">
				<% loop ShippingAddressFields %>
					$FieldHolder
				<% end_loop %>
			</div>
		</section>

		<hr />
	
		<section class="address">
			<div id="address-billing">
				<% loop BillingAddressFields %>
					$FieldHolder
				<% end_loop %>
			</div>
		</section>
		
		<hr />
		
		<section class="order-details">
			<h3><% _t('CheckoutForm.YOUR_ORDER', 'Your Order') %></h3>

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
	 
		<section class="payment-details">
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