{include file="header.tpl"}
{include file="navigation.tpl"}
{literal}
	<script type="text/javascript">
        $(document).ready(function() {
            $('input.branch').typeahead({
                name: 'branch',
                remote : 'ajax/branch_name.php?query=%QUERY'

            });
        })
	</script>
{/literal}
<section class="content">
	<div class="row">
		<div class="col-lg-4" style="margin-top: 10px;">
			<div class="panel panel-info">
				<div class="panel-heading">
					<strong>Add Branch Target</strong>
				</div>
				<div class="panel-body">

					<form role="form" action="branch_target.php?job=add" method="post">
						<div class="form-group">
							<input class="form-control branch" type="text" name="branch" value="{$branch}" placeholder="Branch"/>
						</div>
						<div class="form-group">
							<input class="form-control" type="text" name="amount" value="{$amount}" placeholder="Amount"/>
						</div>

						<div class="form-group" style="visibility:visible;">
							<div class="controls input-append date form_date" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
								<input type="text" name="date" class="form-control" id="datepicker" value="{$date}"  placeholder=" Date" style="width: 100%;">
								<span class="add-on"><i class="icon-remove"></i></span>
								<span class="add-on"><i class="icon-th"></i></span>
							</div>
							<input type="hidden" id="dtp_input1" value="" />
						</div>
						<button type="submit" name="ok" value="Save" class="btn btn-default">Save</button>
					</form>
				</div>
			</div>
		</div>

		<div class="col-lg-6">
			<div class="panel panel-info" style="margin-top: 10px;">
				<div class="panel-heading">
					<strong>Target</strong>
				</div>
				<div class="panel-body">
                    {php}list_branch_target();{/php}
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