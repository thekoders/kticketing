{include file="header.tpl"}
{include file="navigation.tpl"}

{literal}

</script>
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
					<strong>Search By withdraw No</strong>
				</div>
				<div class="panel-body">
					<form name="withdraw_form" action="withdraw.php?job=save" method="post">
						<div class="row">
							<div class="col-lg-2">
								<div class="form-group">
									<input class="form-control" type="text" name="with_no" value="{$with_no}" readonly />
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<div class="controls input-append date form_date" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
										<input type="text" name="date" value="{$date}" class="form-control" id="datepicker" readonly placeholder="Date" style="width: 100%;">
										<span class="add-on"><i class="icon-remove"></i></span>
										<span class="add-on"><i class="icon-th"></i></span>
									</div>
									<input type="hidden" id="dtp_input1" value="" />
								</div>
							</div>
							<div class="col-lg-4">
								<div class="form-group">
									<input class="account form-control" type="text" name="account" value="{$account}" required="required" placeholder="Bank"/>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<input class="form-control" type="text" name="amount" value="{$amount}" required="required" placeholder="Amount"/>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="form-group">
									<input class="form-control" type="text" name="narration" value="{$narration}" required="required" placeholder="Note"/>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="form-group">
									<button type="submit" name="ok" class="btn btn-primary">Save</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12" style="margin-top: 10px;">
			<div class="panel panel-info">
				<div class="panel-heading">
					<strong>Latest withdraws</strong>
				</div>
				<div class="panel-body">
                    {php}list_withdraw();{/php}
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
{/literal}