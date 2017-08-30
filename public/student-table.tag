<student-table>
    <h1>Student Table</h1>
    <table border="1">
        <thead>
            <tr>
                <th each={opts.headers}>
                    {columnName}
                </th>
            </tr>
        </thead>
        <tbody>
            <tr each={studentList}>
                <td>{first_name}</td>
                <td>{last_name}</td>
                <td>{email}</td>
                <td>{contact}</td>
            </tr>
        </tbody>
    </table>
    var self = this
    this.studentList = [];
    opts.dataRequest.done(function(data){
        self.studentList = data;
        self.update(this.studentList)
        console.log(data);
    })
</student-table>