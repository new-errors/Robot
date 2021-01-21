*** Settings ***
Library     Selenium2Library   implicit_wait=60  timeout=60

*** Variables ***
${menu_class_qt}        class:fl-sell
${document_title_qt}    ใบเสนอราคา
${button_create_doc}    //button[.//text() = "สร้างใหม่"]
${project_name}         class:project-name
@{product_code} =       S001    S002    S003    S004    N001    N002    N003    N004    V001    V002    V003    V004

*** Keywords ***
# ฟังก์ชั้่น
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
    Input Text                  ${project_name}      ${DateTime}

เลือกรายชื่อผู้ติดต่อ



เพิ่มรายการสินค้า
    FOR    ${i}    IN RANGE     9
        Click Element           css:.document-remark > a
    END

เลือกรายการสินค้า
    FOR     ${i}    IN RANGE    12
        Log   ${i}
        Input Text                      css:.item${i} td:nth-child(3) .tt-input       ${product_code[${i}]}
        Click Element                   css:.item${i} td:nth-child(3) .tt-dataset > div > div:nth-child(1)
    END
    
    
