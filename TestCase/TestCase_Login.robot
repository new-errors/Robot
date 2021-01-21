*** Settings ***
Library     Selenium2Library   implicit_wait=60  timeout=60

*** Variables ***
${browser}              chrome
${url}                  https://flowaccount.com
${email}                goodnight@flowaccount.com
${password}             1q1q1q1q@

*** Keywords ***
เปิดเว็บ flowaccount.com
    Open Browser     ${url}     ${browser}
    maximize browser window
    
เข้าหน้า Auth Login FlowAccount
    Click Element       class:app-border-btn

เข้าใช้งาน FlowAccount
    Input Text          id:Email            ${email}
    Input Text          id:Password         ${password}
    Click Element       class:login-lbl

เข้าใช้งาน FlowAccount สำเร็จ
    Wait Until Element Is Visible   class:panel-heading   
    Wait Until Page Contains        ภาพรวมบริษัท