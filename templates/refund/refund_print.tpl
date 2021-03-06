{include file="print.tpl"}
{include file="print_company_detail.tpl"}

	<div class="row" style="margin-left: 1px;">
		<div class="col-xs-12" style="text-align: center; margin-top: -10px;">
			<h1><strong>REFUND REQUEST</strong></h1>
		</div>
	</div>
	<div class="col-xs-12">
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-xs-12">
				<strong>To : </strong>{$travels}
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-xs-12" style="text-align: center;">
				Please proceed the refund process for the following Passengers in this ticket.
			</div>
		</div>


		<div class="row" style="margin-bottom: 10px;">
			<div class="col-xs-3">
				<strong>Booking No : </strong>{$booking_no}
			</div>
			<div class="col-xs-3">
				<strong>Booking Ref : </strong>{$pnr}
			</div>
			<div class="col-xs-6">
				<strong>Refund Application for : </strong>{$type}
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<h4>Ticket Details</h4>
                {php} get_booking_details_for_voucher($_SESSION['booking_no']); {/php}
			</div>
			<div class="col-xs-12">
				<h4>Refund Appling Passengers Details</h4>
                {php} list_passengers_for_refund_no_view($_SESSION['refund_no']); {/php}
			</div>
		</div>

		<div class="row" style="margin-top: 5px; font-size: 12px; margin-left: 1px;">
			<div class="col-xs-12">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<td width="120">PREPARED BY :</td>
							<td width="150"><strong>{$saved_by}</strong></td>
							<td width="200">AUTHORIZED SIGNATURE :</td>
							<td></td>
						</tr>

					</table>
				</div>
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-xs-12" style="text-align: center;">
				We do not hold ourselves responsible for any alteration made in this document
			</div>
		</div>
	</div>
</div>

{include file="footer.tpl"}

{literal}
	<script>
        $(function () {
            $("#example1").DataTable();
        });
	</script>
{/literal}