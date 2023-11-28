package com.cabbage.biz.search.search;

import lombok.*;

import java.util.Date;
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class SearchVO {
    private String userId;
    private String searchKeyword;
    private Date searchDate;
    private String useYn;
}
