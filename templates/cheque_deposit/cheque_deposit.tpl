{include file="header.tpl"}
{include file="navigation.tpl"}

{literal}
	<script type="text/javascript">
        $(document).ready(function() {
            $('input.account').typeahead({
                name: 'account',
                remote : 'ajax/bank.php?query=%QUERY'

            });
        })
	</script>

{/literal}

{if $error_message}
	<div class="row">
		<div class="col-lg-12" style="margin-top: 10px;">
			<div class="alert alert-danger"><strong>{$error_message}</strong></div>
		</div>
	</div>
{/if}

<section class="content">
	<div class="row">
		<div class="col-lg-12" style="margin-top: 10px;">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="row">
						<div class="col-lg-3">
							Bank : {$account}
						</div>
						<div class="col-lg-3">
							Deposit Date : {$deposit_date}
						</div>
						<div class="col-lg-1">
							<a class="btn btn-default" target="_blank" href="cheque_deposit.php?job=print">Print</a></b>
						</div>
						<div class="col-lg-3">
							<a class="btn btn-default" href="cheque_deposit.php?job=cheque_deposit_select_form">New Date</a></b>
						</div>
					</div>
				</div>
				<!--<div class="panel-body">
            		<!--<form name="cheque_inquiry_form" action="cheque_deposit.php?job=inquiry" method="post">
						<div class="row">
							<div class="col-lg-9">
								<div class="form-group">
									<input class="form-control" type="text" name="che_no" value="{$che_no}" required="required" placeholder="Cheque No"/>
								</div>                 
                    		</div>
							<div class="col-lg-3">
								<div class="form-group">
									<button type="submit" name="ok" class="btn btn-danger">Inquiry</button>
								</div>                 
                    		</div>				
						</div>                 
                   </form>-->
				<div class="row">
					<div class="col-lg-12">
                        <strong>Not Deposited Cheques</strong>
                        {php}list_receipt_not_deposit($_SESSION['deposit_date']);{/php}
                    </div>
                </div>
				<div class="row">
					<div class="col-lg-12">
						<strong>Deposited Cheques</u></strong>
                        {php}list_receipt_deposit();{/php}
					</div>
				</div>
			</div>
		</div>
	</div>
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
			$("#example1").DataTable();
		});
	</script>

    <script>
        $(function () {
            $("#example2").DataTable();
        });
    </script>
{/literal}
