$(".modal-footer .btn-primary").show();
$('.modal-title').html("Editing About");
$('.modal-body').html("<%= j render 'abouts/form', about: @abouts %>");
$('.modal').modal();
