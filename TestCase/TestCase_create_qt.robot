*** Settings ***
Library     Selenium2Library   implicit_wait=60  timeout=60

*** Variables ***
#Value
${document_title_qt}    ใบเสนอราคา
@{product_code} =       S001    S002    S003    S004    N001    N002    N003    N004    V001    V002    V003    V004
@{contact_code} =       C001    C002    C003
${document_serial} 
${summary_qt}           12,210.00
${text_save_sucess}     บันทึกข้อมูลสำเร็จ

#Element
${menu_class_qt}        class:fl-sell
${button_create_doc}    //button[.//text() = "สร้างใหม่"]
${project_name}         css:.detail-bottom .project-name
${serial_number}        css:.div-head-title .headtitle-text 
${input_contact}        css:input[placeholder="เลือกลูกค้า หรือพิมพ์เพื่อสร้างใหม่"]
${list_contact}         css:.customer-div div > .tt-dataset > div > div:nth-child(1)
${add_product}          css:.document-remark > a
${case5_value}          css:.case-5 > div:nth-child(2) .value
${save_document}        css:#documentHeader .approved-btn button:nth-child(1)
${close_document}       css:#documentHeader .cancel-btn
${toast_success}        css:#toast-container .toast-success
     

*** Keywords ***
# Function
Get DateTime Day
    ${value} =  Get Current Date  result_format=%d-%m-%y
    [Return]    ${value}
Get DateTime
    ${value} =  Get Current Date  result_format=%d-%m-%y-%H:%M:%S 
    [Return]    ${value}
Get Update Value
    ${value} =  Get Current Date  result_format=%H%M%S%d%m%y 
    [Return]    ${value}

เข้าสู่หน้าใบเสนอราคา
    Click Element               ${menu_class_qt}
    Wait Until Page Contains    ${document_title_qt}

สร้างใบเสนอราคา
       
    ${DateTime} =  Get DateTime
    
    Click Element               ${button_create_doc}
    Wait Until Page Contains    สร้าง${document_title_qt}            
    Input Text                  ${project_name}         ${DateTime}

    ${document_serial}          Get Text                ${serial_number}
    

    #Log                         Serial ${document_serial}

เลือกรายชื่อผู้ติดต่อ
    Input Text                  ${input_contact}        ${contact_code[0]}
    Click Element               ${list_contact} 

เพิ่มรายการสินค้า
    FOR    ${i}    IN RANGE     19
        Click Element           ${add_product}  
    END

เลือกรายการสินค้า
    FOR     ${i}    IN RANGE    12
        Log   ${i}
        Input Text              css:.item${i} td:nth-child(3) .tt-input         ${product_code[${i}]}
        Click Element           css:.item${i} td:nth-child(3) .tt-dataset > div > div:nth-child(1)
    END

ตรวจสอบยอดรวมเอกสาร
    ${value_top}        Get Text            css:.total-value
    ${value_buttom}     Get Text            ${case5_value}  

    Should be equal     ${value_top}        ${summary_qt} 
    Should be equal     ${value_buttom}     ${summary_qt} 


บันทึกเอกสาร
    Click Element                                       ${save_document}
    Wait Until Element Is Visible                       ${toast_success}
    Wait Until Page Contains                            ${text_save_sucess}
    Click Element                                       ${close_document}
    
    
