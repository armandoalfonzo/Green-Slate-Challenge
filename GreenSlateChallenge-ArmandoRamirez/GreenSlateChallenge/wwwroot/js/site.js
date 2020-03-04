$(document).ready(function () {
    $.ajax({
        url: "/UserProject/GetUsers",
        type: "GET",
        dataType: "json",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                $("#UsersSelect").append("<option id='" + data[i].id + "'>" + data[i].firstName + " " + data[i].lastName + "</option>");
            }
        }
    });

    $("#UsersSelect").change(function () {
        $.ajax({
            url: "/UserProject/GetProjectsByUser",
            type: "GET",
            data: { UserId: $("#UsersSelect option:selected").attr('id') },
            dataType: "json",
            success: function (data) {
                console.log(data);
                $("#ProjectsTable").removeAttr("hidden");
                $("#ProjectsTable tbody").find("tr").remove();
                for (var i = 0; i < data.length; i++) {
                    var row = "<tr><td>" + data[i].id + "</td><td>" + data[i].startDate + "</td><td>"
                        + data[i].timeToStart + " </td><td>" + data[i].endDate + "</td><td>" + data[i].credits + "</td><td>"
                        + data[i].status + "</td></tr>";
                    $("#ProjectsTable").append(row);
                }
            }
        });
    });
});
