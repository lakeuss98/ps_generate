
          
 use billing_db
 create table Invoices;
(
    id          bigint unsigned auto_increment comment 'id of the type of Invoices'
        primary key,
        num_invoice  int  null comment 'numero of invoice ',total_ht  int  null comment 'total hors taxe  ',da  int  null comment 'da ',tva  int  null comment 'tva of invoice ',op_fee  int  null comment 'op  ',clients_id  int  not null comment ' the id refenced clients table '
    sso_user_id int                                 null comment 'the id of the user in the sso.',
    org_id      int                                 null comment 'the id of the organization.',
    created_at  timestamp default CURRENT_TIMESTAMP  comment 'date we create the type of question',
    updated_at  timestamp default CURRENT_TIMESTAMP comment 'date we update the type of question',
    constraint  clients_id_client_id_fk  foreign key (client_id) references Clients (id) on update cascade on delete cascade 
);

 
      # routine to count all occurences of  Invoices table
use billing_db
create procedure sp_Invoice_count()
BEGIN
    select count(*) as total
    from Invoices;
END;

       # routine to create   Invoices table
   
create
   procedure sp_invoice_create(IN num_invoice_ int,,IN total_ht_ int,,IN da_ int,,IN tva_ int,,IN op_fee_ int,,IN clients_id_ int, IN ssoUserId int, IN orgId int  )
BEGIN
    INSERT INTO Invoices(answer, question_id, is_correct,sso_user_id, org_id)
    VALUES (num_invoice_ ,,total_ht_ ,,da_ ,,tva_ ,,op_fee_ ,,clients_id_ , ssoUserId, orgId);
    select * from Invoices where id = last_insert_id() limit 1;
END;


# routine to read  on occurences of  Invoices table to use id 
create
     procedure sp_invoice_read(IN id_ bigint)
BEGIN
    select *
    from  Invoices
    where id = id_
    limit 1;
END;

# routine to update   Invoices table to use id 
create
     procedure sp_invoice_update(IN num_invoice_ int,,IN total_ht_ int,,IN da_ int,,IN tva_ int,,IN op_fee_ int,,IN clients_id_ int, id_ int)
BEGIN
    update Invoices
    set num_invoice = num_invoice_ ,,total_ht = total_ht_ ,,da = da_ ,,tva = tva_ ,,op_fee = op_fee_ ,,clients_id = clients_id_ ,
    where id = id_;
END;
