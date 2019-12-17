<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
   $(function(){
      let deleteId="";
      $('#deleteModal').on('show.bs.modal', function(event) {          
         deleteId = $(event.relatedTarget).data('delete-id');
         $(".modal-body").prepend("<b>[ "+deleteId+" ]</b>");
         $("#deletebtn").attr("href","MemberDelete.do?empno="+deleteId);
      });
   });
</script>
</head>
<body>
<!-- Delete Modal-->
  <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-trash-alt"></i> 회원 삭제</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body"> 회원을 삭제 하시겠습니까?</div>
        <div class="modal-footer">
          <a id="deletebtn" class="btn btn-primary">Delete</a>
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
        </div>
      </div>
    </div>
  </div>
</body>
</html>