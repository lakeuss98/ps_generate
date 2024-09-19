
          
 use billing_db
 create table Invoice_articles;
(
    id          bigint unsigned auto_increment comment 'id of the type of Invoice_articles'
        primary key,
        invoices_id    not null comment 'key refenced invoice table  ',articles_id    not null comment 'key  referenced  article table  '
    sso_user_id int                                 null comment 'the id of the user in the sso.',
    org_id      int                                 null comment 'the id of the organization.',
    created_at  timestamp default CURRENT_TIMESTAMP  comment 'date we create the type of question',
    updated_at  timestamp default CURRENT_TIMESTAMP comment 'date we update the type of question',
    constraint  invoices_id_invoice_id_fk  foreign key (invoice_id) references Invoices (id) on update cascade on delete cascade,constraint  articles_id_article_id_fk  foreign key (article_id) references Articles (id) on update cascade on delete cascade 
);

 
      # routine to count all occurences of  Invoice_articles table
use billing_db
create procedure sp_Invoice_article_count()
BEGIN
    select count(*) as total
    from Invoice_articles;
END;

       # routine to create   Invoice_articles table
   
create
   procedure sp_invoice_article_create(IN invoices_id_ ,IN articles_id_ , IN ssoUserId int, IN orgId int  )
BEGIN
    INSERT INTO Invoice_articles(answer, question_id, is_correct,sso_user_id, org_id)
    VALUES (invoices_id_ ,,articles_id_ , ssoUserId, orgId);
    select * from Invoice_articles where id = last_insert_id() limit 1;
END;

# routine to read  on occurences of  Invoice_articles table to use id 
create
     procedure sp_invoice_article_read(IN id_ bigint)
BEGIN
    select *
    from  Invoice_articles
    where id = id_
    limit 1;
END;

# routine to update   Invoice_articles table to use id 
create
     procedure sp_invoice_article_update(IN invoices_id_ ,IN articles_id_ , id_ int)
BEGIN
    update Invoice_articles
    set invoices_id = invoices_id_ ,articles_id = articles_id_ ,
    where id = id_;
END;
