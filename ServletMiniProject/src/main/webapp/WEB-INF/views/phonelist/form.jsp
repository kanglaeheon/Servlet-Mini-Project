<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="modal" role="dialog" id="addDialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">새 주소 추가</h5>
				<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
            	</button>
			</div>
			<div class="modal-body">
				<form action="<%= request.getContextPath() %>/?a=form" method="POST">
				<!-- hidden은 사용자 입력은 아니지만 전송해야 할 데이터 -->
				<input type="hidden" value="form" name="a" />
				<div class="form-row row">
					<label for="name">이름</label>
					<input type="text" name="name" id="name" />
				</div>
				</br>
				<div class="form-row row">
					<label for="hp">휴대전화</label>
					<input type="text" name="hp" id="hp" />
				</div>
				</br>
				<div class="form-row row">
					<label for="tel">전화번호</label>
					<input type="text" name="tel" id="tel" />
				</div>
				</br>
					<button type="submit" value="주소 등록" class="btn btn-primary">주소 등록</button>
					<button type="reset" class="btn btn-secondary">재작성</button>
				</form>
			</div>
		</div>
	</div>
</div>