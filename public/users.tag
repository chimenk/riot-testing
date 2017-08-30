<users>
<div class="row">
<div class="col-md-10"><h4>User List</h4></div>
<div class="col-md-1"><button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#add" >Tambah Data</button></div>

</div>
<div class="table-responsive">
    <table id="mytable" class="table table-bordered table-striped">
        <thead>
            <th><input type="checkbox" id="checkall" /></th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Address</th>
            <th>Email</th>
            <th>Contact</th>
            <th>Edit</th>
            <th>Delete</th>
        </thead>
        <tbody>
            <tr each={ users }>
                <td><input type="checkbox" class="checkthis" /></td>
                <td>{ first_name }</td>
                <td>{ last_name }</td>
                <td>{ address }</td>
                <td>{ email }</td>
                <td>{ contact }</td>
                <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs edit-data" data-title="Edit" data-toggle="modal" data-target="#edit" data-id="{ _id }" onclick={ parent.edit_data }><span class="glyphicon glyphicon-pencil"></span></button></p></td>
                <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" data-id="{ _id }" onclick={ parent.delete_data }><span class="glyphicon glyphicon-trash"></span></button></p></td>
            </tr>
        </tbody>
    </table>
    <div class="clearfix"></div>
    <ul class="pagination pull-right">
      <li class="{ prevState }"><a href="#" class="goTo" data-offset={offset}><span class="glyphicon glyphicon-chevron-left"></span></a></li>
      <li each={paging} class={status}><a href="#" class="goTo" data-offset={offset} onclick="{ parent.changePage }">{pageNo}</a></li>
      <li class="{ nextState }"><a href="{ nextUrl }"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
    </ul>
</div>

<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="add" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Add New User</h4>
      </div>
        <form onsubmit="{ newuser }" id="new_form">
          <div class="modal-body">
            <div class="form-group">
              <input class="form-control" name="first_name" type="text" placeholder="First Name">
            </div>
            <div class="form-group">
              <input class="form-control " name="last_name" type="text" placeholder="Last Name">
            </div>
            <div class="form-group">
              <input class="form-control " name="email" type="text" placeholder="E-mail address">
            </div>
            <div class="form-group">
              <textarea rows="2" class="form-control" name="address" placeholder="Address"></textarea>
            </div>
            <div class="form-group">
              <input class="form-control " name="contact" type="text" placeholder="Contact Number">
            </div>
          </div>
          <div class="modal-footer ">
        <button type="submit" class="btn btn-primary btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Add</button>
        </form>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
</div>

<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Edit User Detail</h4>
      </div>
        <form onsubmit="{ submit }" id="edit_form">
          <div class="modal-body">
            <div class="form-group">
              <input type="hidden" name="id" value="{ edit_id }">
              <input class="form-control" name="first_name" type="text" value="{ edit_first_name }">
            </div>
            <div class="form-group">
              <input class="form-control " name="last_name" type="text" value="{ edit_last_name }">
            </div>
            <div class="form-group">
              <input class="form-control " name="email" type="text" value="{ edit_email }">
            </div>
            <div class="form-group">
              <textarea rows="2" class="form-control" name="address" >{ edit_address }</textarea>
            </div>
            <div class="form-group">
              <input class="form-control " name="contact" type="text" value="{ edit_contact }">
            </div>
          </div>
          <div class="modal-footer ">
        <button type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
        </form>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
</div>

<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
          <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
        </div>
        <div class="modal-body">
          <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
        </div>
        <div class="modal-footer ">
          <form onsubmit="{ deleteData }">
            <input type="hidden" name="id" value="{ delete_id }">
            <button type="submit" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
          </form>
        </div>
      </div>
    <!-- /.modal-content --> 
  </div>
<!-- /.modal-dialog -->


<!-- Script section -->
var self=this
listData(1,0)

<!-- Listing data from API -->
function listData(pn, ofs) {
  axios.get('/api/user?page=' + pn).then(function (response) {
    self.update({ users: response.data.data })
    self.total = response.data.total
    self.per_page = response.data.per_page
    if(response.data.prev_page_url == null){
      self.prevState = 'disabled'
    }else{
      self.prevState = ''
    }
    if(response.data.next_page_url == null) {
      self.nextState = 'disabled'
    }else{
      self.nextState = ''
    }
    pagination(ofs)
  })
  .catch(function (error) {
    console.log(error)
  })
}

<!-- Get clicked row data and assign to edit form -->
edit_data(e) {
  var item = e.item
  self.edit_id = item._id
  self.edit_first_name = item.first_name
  self.edit_last_name = item.last_name
  self.edit_address = item.address
  self.edit_email = item.email
  self.edit_contact = item.contact
}

<!-- Get ID from clicked row -->
delete_data(e) {
  var item = e.item
  console.log(item)
  self.delete_id = item._id
}

<!-- Delete data using API -->
deleteData(e) {
  e.preventDefault()
  axios.delete('/api/user/' + self.delete_id)
    .then(function (response) {
      console.log(response)
      listData(1,0)
      $('#delete').modal('hide')
    })
    .catch(function (error) {
      console.log(error)
    })
}

<!-- Create New User -->
newuser(e) {
  e.preventDefault()
  var form_data = e.target
  axios.post('/api/user', {
    first_name: form_data.first_name.value,
    last_name: form_data.last_name.value,
    address: form_data.address.value,
    email: form_data.email.value,
    contact: form_data.contact.value
  })
  .then(function (response) {
    console.log(response)
    $('#add').modal('hide');
    listData(1,0)
  })
  .catch(function (error) {
    console.log(error)
  })
}

<!-- Edit User -->
submit(e) {
  e.preventDefault()
  var form_data = e.target
  var a_id = form_data.id.value
  axios.put('/api/user/' + a_id, {
    first_name: form_data.first_name.value,
    last_name: form_data.last_name.value,
    address: form_data.address.value,
    email: form_data.email.value,
    contact: form_data.contact.value
  })
  .then(function (response) {
    console.log(response)
    $('#edit').modal('hide');
    listData(1,0)
  })
  .catch(function (error) {
    console.log(error)
  })
}

<!-- Pagination function -->
function pagination(p){
  var totalPage = Math.ceil(self.total / self.per_page)
  var no = [];
  for(page=0;page < totalPage;page++){
    var pageNo = page + 1
    var offset = 10 * page
    if(p == offset){
      var status = 'active'
    }else{
      var status = ''
    }
    no.push({'pageNo': pageNo, 'offset': offset, 'status': status})
  }
  console.log(no)
  self.update({ paging : no})
}

<!-- Change listed record function -->
changePage(e) {
  e.preventDefault()
  listData(e.item.pageNo, e.item.offset)
}
</users>