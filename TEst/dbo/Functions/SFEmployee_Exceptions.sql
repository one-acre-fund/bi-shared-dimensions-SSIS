CREATE FUNCTION SFEmployee_Exceptions()
RETURNS TABLE 
AS 
RETURN
With HREmployee AS (
	SELECT  [EmployeeID] HREmpID,[CountryCode]  HRCountryCode,[DepartmentCode] HRDep,[LocationCode]   HRLoc   ,[FullName]   HRName   ,[FirstName]     HRFirstName ,[MiddleName]   HRMiddleName ,[Active] HRActive, [LastName]   HRLastName   ,[JobGradeCode] HRJobGrade,[EmailAddress] HREmail    ,[EmployeeCode]    HREmpCode      ,[BankName]      ,[BankAccountNumber]      ,[BankAccountName]      ,[BankBranchName]      ,[SwiftCode]      ,[StartDate]   HRStartDate   ,[TerminationDate]    HRTerminationDate  ,[PayGrade]  HRPayGrade    ,[JobTitle]     HRJobTitle ,[MMNumber]  HRMMNumber    ,[MMName]    HRMMName  ,[MMCarrier]     HRMMCarrier   ,[Project]   HRProject    ,[Nationality]   HRNationality   ,[Gender]   HRGender, [WebUser]   HRWebUser
	FROM [OAF_HR_DATAWAREHOUSE].[dbo].[Employee]
)
, SFEmp AS (
	SELECT [SFID]     ,[CurrentEmployeeID]      ,[EmployeeCode]    SFEmpCode  ,[CountryCode]    SFcountryCode       ,[DepartmentCode]   SFDep   ,[LocationCode]   SFLoc   ,[FullName]     SFName ,[FirstName]  SFFirstName    ,[MiddleName]    SFMiddleName  ,[Active]  SFActive    ,[LastName]   SFLastName   ,[JobGradeCode]   SFJobGrade   ,[EmailAddress]  SFEmail      ,[StartDate]   SFStartDate   ,[TerminationDate]  SfTerminationDate    ,[MMName] SFMMName      ,[MMNumber]    SFMMNumber  ,[MMCarrier]    SFMMCarrier  ,[JobTitle]   SFJobTitle   ,[WebUser]  SFWebuser    ,[Gender]    SFGender  ,[MaritalStatus]   SFMaritalStatus, [PayGrade] SFPayGrade     ,[SFUserID]      ,[LastUpdatedDate]
	FROM [OAF_HR_DATAWAREHOUSE].[dbo].[SFEmployee]
	WHERE CountryCode!='ETH'
)
, employeesWithExceptions AS (
	select CASE 
			When CurrentEmployeeID is null and SFcountryCode!='ETH' then 'SFEmployee <> Employee mismatch'
			when CurrentEmployeeID=HREmpID and SFEmpCode!=HREmpCode then 'EmployeeCode mismatch'
			when CurrentEmployeeID=HREmpID and SFEmpCode=HREmpCode and SFcountryCode!=HRCountryCode then 'Countrycode mismatch'
			when CurrentEmployeeID=HREmpID and SFEmpCode=HREmpCode and SFcountryCode=HRCountryCode and SFEmail!=HREmail then 'Email mismatch'
			when CurrentEmployeeID=HREmpID and SFEmpCode=HREmpCode and SFcountryCode=HRCountryCode and SFEmail=HREmail and (SFActive!=HRActive or SfTerminationDate!=HRTerminationDate) then 'Employee status mismatch'
			when CurrentEmployeeID=HREmpID and SFEmpCode=HREmpCode and SFcountryCode=HRCountryCode and SFEmail=HREmail and (SFLoc!=HRLoc or SFDep!=HRDep or SFJobGrade!=HRJobGrade) then 'Department/Location/JobGrade mismatch'
			when CurrentEmployeeID=HREmpID and SFEmpCode=HREmpCode and SFcountryCode=HRCountryCode and SFEmail!=HREmail and (SFMMName!=SFMMName or SFMMCarrier!=SFMMCarrier or SFMMNumber!=SFMMNumber) then 'MM details mismatch'
			when CurrentEmployeeID=HREmpID and SFEmpCode=HREmpCode and SFcountryCode=HRCountryCode and SFEmail!=HREmail and SFWebuser!=HRWebUser then 'WebUser mismatch'
			when CurrentEmployeeID=HREmpID and SFEmpCode=HREmpCode and SFcountryCode=HRCountryCode and SFEmail!=HREmail and SFJobTitle!=HRJobTitle then 'Job title mismatch'
		else Null end as MismatchIssues,
 *
from SFEmp sf
left outer join HREmployee e on sf.CurrentEmployeeId=e.HREmpID

)

select MismatchIssues, SFUserID, SFcountryCode, SFEmpCode, SFDep SFDepartmentCode, SFLoc SFLocationCode, SFJobGrade,SFFirstName,SFMiddleName,SFLastName, SFEmail, SFActive, SFStartDate, SfTerminationDate, SFMMName,SFMMNumber,SFMMCarrier, SFJobTitle, SFWebuser,SFGender,SFPayGrade, HRCountryCode, HREmpCode, HRDep HRDepartmentCode, HRLoc HRLocationCode, HRJobGrade,HRFirstName, HRMiddleName, HRLastName, HREmail, HRActive, HRStartDate, HRTerminationDate, HRMMName, HRMMNumber, HRMMCarrier, HRJobTitle, HRWebUser, HRGender, HRPayGrade
from employeesWithExceptions 
where MismatchIssues is not null

