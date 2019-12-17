$(function() {
   let table = $('#dataTable').DataTable();

   $('#dataTable_filter')
         .prepend(
               '<select id="select" class="custom-select" style="margin-right : 10px; width: 100px"></select>');
   $('#dataTable_filter')
         .prepend(
               '부서 번호 : <select id="deptSelect" class="custom-select" style="margin-right : 10px; width: 80px"></select>');
   $.ajax({
      url : "AjaxGetDeptNos.do",
      dataType : "json",
      success : function(data) {
         $("#deptSelect").empty();
         $("#deptSelect").append("<option value='*'> * </option>");
         $.each(data, function(index, element) {
            $("#deptSelect").append("<option value='" + element + "'>" + element + "</option>");
         })
      }
   });

   // 검색 th 칼럼 별로 할 수 있게 select 생성
   let ths = $('#dataTable > thead > tr > th');
   ths.each(function(index, element) {
      if (index < 2) // 앞에 두개만
         $('#select').append('<option>' + element.innerHTML + '</option>');
   });

   // select에 따라 검색 결과 table에 표현
   $('.dataTables_filter input').keyup(function() {
      tableSearch();
   });

   $("#deptSelect").change(function() {
      tableSearch();
   })

   function tableSearch() {
      let colIndex = document.querySelector('#select').selectedIndex;
      let deptno = $("#deptSelect option:selected").val();
      let searchText = $('.dataTables_filter input').val();
      
      if (deptno == "*") {
         table.column(colIndex).search(searchText).column(2).search("").draw();
      } else {
         table.column(colIndex).search(searchText).column(2).search(deptno).draw();
      }
   }
});