@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        
        
        <div class="col-md-12">
          <users></users>
        </div>
@endsection

@push('scripts')
<script src="users.tag" type="riot/tag"></script>
<script type="text/javascript">
$(document).ready(function(){
    $("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    $("[data-toggle=tooltip]").tooltip();

});
</script>
@endpush