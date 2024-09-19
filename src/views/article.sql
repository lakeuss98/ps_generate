
          
 use billing_db
 create table Articles;
(
    id          bigint unsigned auto_increment comment 'id of the type of Articles'
        primary key,
        names  varchar(255)  null comment 'name of article ',description  varchar(255)  null comment 'description of article ',pu_ht  int  null comment 'price unitary hors taxe ',pu_ht_custom  int  null comment 'price unitary hors taxe custom ',is_rate  int  null comment 'if is have a rate '
    sso_user_id int                                 null comment 'the id of the user in the sso.',
    org_id      int                                 null comment 'the id of the organization.',
    created_at  timestamp default CURRENT_TIMESTAMP  comment 'date we create the type of question',
    updated_at  timestamp default CURRENT_TIMESTAMP comment 'date we update the type of question',
     
);

 
      # routine to count all occurences of  Articles table
use billing_db
create procedure sp_Article_count()
BEGIN
    select count(*) as total
    from Articles;
END;

       # routine to create   Articles table
   
create
   procedure sp_article_create(IN names_ varchar(255),,IN description_ varchar(255),,IN pu_ht_ int,,IN pu_ht_custom_ int,,IN is_rate_ int, IN ssoUserId int, IN orgId int  )
BEGIN
    INSERT INTO Articles(answer, question_id, is_correct,sso_user_id, org_id)
    VALUES (names_ ,,description_ ,,pu_ht_ ,,pu_ht_custom_ ,,is_rate_ , ssoUserId, orgId);
    select * from Articles where id = last_insert_id() limit 1;
END;


# routine to read  on occurences of  Articles table to use id 
create
     procedure sp_article_read(IN id_ bigint)
BEGIN
    select *
    from  Articles
    where id = id_
    limit 1;
END;

# routine to update   Articles table to use id 
create
     procedure sp_article_update(IN names_ varchar(255),,IN description_ varchar(255),,IN pu_ht_ int,,IN pu_ht_custom_ int,,IN is_rate_ int, id_ int)
BEGIN
    update Articles
    set names = names_ ,,description = description_ ,,pu_ht = pu_ht_ ,,pu_ht_custom = pu_ht_custom_ ,,is_rate = is_rate_ ,
    where id = id_;
END;
