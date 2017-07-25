function [ output_args ] = Untitled5( input_args )
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
mail = 'tuanjie51571@sohu.com'; %change

psswd = 'yh520512930'; %change

host = 'smtp.sohu.com';

port  = '25';  % I find 465 port does not work for me. 

emailto = 'bananahydra@foxmail.com';%change

m_subject = 'subject';

m_text = 'test';

setpref( 'Internet','E_mail', mail );

setpref( 'Internet', 'SMTP_Server', host );

setpref( 'Internet', 'SMTP_Username', mail );

setpref( 'Internet', 'SMTP_Password', psswd );

props = java.lang.System.getProperties;

props.setProperty( 'mail.smtp.user', mail );

props.setProperty( 'mail.smtp.host', host );

props.setProperty( 'mail.smtp.port', port );

props.setProperty( 'mail.smtp.starttls.enable', 'true' );

props.setProperty( 'mail.smtp.debug', 'true' );

props.setProperty( 'mail.smtp.auth', 'true' );

props.setProperty( 'mail.smtp.socketFactory.port', port );

props.setProperty( 'mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory' );

props.setProperty( 'mail.smtp.socketFactory.fallback', 'false' );

props.remove( 'mail.smtp.socketFactory.class' );



sendmail( emailto , 'Hello from MATLAB', 'Hello from MATLAB' );

end

