<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<div >
	<nav aria-label="Page navigation example">
		<ul class="pagination" >
			<c:if test="${!pagination.startRange }">
				<li class="page-item"><a class="page-link"
					href="${root }/list?currentPage=${pagination.startPage-1 }">이전</a></li>
			</c:if>
			<c:forEach begin="${pagination.startPage }"
				end="${pagination.endPage }" var="pageNumber">
				<li class="page-item"><a class="page-link"
					href="${root }/list?currentPage=${pageNumber }">${pageNumber }</a></li>
			</c:forEach>
			<c:if test="${!pagination.endRange }">
				<li class="page-item"><a class="page-link"
					href="${root }/list?currentPage=${pagination.endPage+1 }">다음</a></li>
			</c:if>
		</ul>
	</nav>
</div>
