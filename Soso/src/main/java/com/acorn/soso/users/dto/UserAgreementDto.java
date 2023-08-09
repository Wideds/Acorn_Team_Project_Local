package com.acorn.soso.users.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("UserAgreementDto")
public class UserAgreementDto {
	
	private Integer svcUsePolicyAgreement;
	private Integer psInfoProcessAgreement;
    private Integer mktInfoReceiveAgreement;
}
