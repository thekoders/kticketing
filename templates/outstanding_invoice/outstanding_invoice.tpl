{include file="header.tpl"}
{include file="navigation.tpl"}
{literal}
	<script type="text/javascript">
        $(document).ready(function() {
            $('input.customer').typeahead({
                name: 'customer',
                remote : 'ajax/invoice_customer.php?query=%QUERY'

            });
        })
	</script>
{/literal}

<section class="content">
	<div class="row">
		<div class="panel panel-info" style="margin-top: 10px;">
			<div class="panel-heading">
				<strong>Search Outstanding Invoice</strong>
			</div>
			<div class="panel-body">
				<form role="form" action="outstanding_invoice.php?job=search" method="post">
					<div class="col-lg-3">
						<div class="form-group">
							<input class="form-control customer" type="text" name="customer" value="{$customer}"/>
						</div>
					</div>
					<div class="col-lg-2">
						<div class="form-group" style="visibility:visible;">
							<div class="controls input-append date form_date" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
								<input type="text" name="from_date" class="form-control" id="datepicker" value="{$from_date}"  placeholder="From Date" style="width: 100%;">
								<span class="add-on"><i class="icon-remove"></i></span>
								<span class="add-on"><i class="icon-th"></i></span>
							</div>
							<input type="hidden" id="dtp_input1" value="" />
						</div>
					</div>
					<div class="col-lg-2">
						<div class="form-group" style="visibility:visible;">
							<div class="controls input-append date form_date" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
								<input type="text" name="to_date" class="form-control" id="datepicker1" value="{$to_date}"  placeholder="To Date" style="width: 100%;">
								<span class="add-on"><i class="icon-remove"></i></span>
								<span class="add-on"><i class="icon-th"></i></span>
							</div>
							<input type="hidden" id="dtp_input1" value="" />
						</div>
					</div>
					<div class="col-lg-2">
						<button type="submit" name="ok" value="Search" class="btn btn-primary">Search</button>
					</div>
				</form>
				<div class="col-lg-2">
					<a href="outstanding_invoice.php?job=outstanding_invoice_print"  class="btn btn-primary" target="blank">Print</a>
				</div>
			</div>
		</div>
	</div>

    {if $search=="on"}
		<div class="row">
			<div class="panel panel-info" style="margin-top: 10px;">
				<div class="panel-heading">
					<strong>Outstanding Invoice</strong>
				</div>
				<div class="panel-body">
                    {php}outstanding_invoice_report($_SESSION['customer'], $_SESSION['from_date'], $_SESSION['to_date']);{/php}
				</div>

				<div class="panel-footer">
				</div>
			</div>
		</div>
    {/if}
</section>

{include file="footer.tpl"}
{literal}
	<script>
        $(function () {

            $('#datepicker').datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true
            });
        });
	</script>
	<script>
        $(function () {

            $('#datepicker1').datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true
            });
        });
	</script>
	<script>
		$(function () {
			$("#example1").DataTable();
		});
	</script>
{/literal}