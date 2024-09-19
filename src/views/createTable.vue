<template>
  <div class="flex h-screen w-full flex-col py-3">
    <div class="flex items-center justify-between py-10">
      <div class="flex">
        <h1 class="text-3xl font-black">DataBase name:</h1>
        <input type="text" name="bd" v-model="dbName" placeholder="Enter data base name "
          class="ml-4 flex items-center border-none bg-transparent text-3xl font-black underline underline-offset-4 focus:outline-none">
      </div>
      <div @click=" spgenerateCode = generateStoredProcedure(dbName, tableName, attributes)"
        class="mx-[7%] flex w-60 cursor-pointer items-center justify-center rounded-lg bg-slate-700 py-2 text-xl font-semibold text-white"> Generate </div>
    </div>
    <div class="flex h-[95%] w-full">
      <div class="flex w-[50%] items-center justify-center gap-y-10 px-20">

        <!-- <div class="flex min-h-[400px] min-w-[400px] flex-col rounded-xl bg-transparent">
  <input :value="tableName" :v-form="tableName" type="text"
    class="flex h-[15%] items-center justify-center rounded-t-2xl border-2 border-solid border-black bg-slate-400 text-center">
    <ul class="flex-col border-2 border-x-2 border-black bg-lime-400 px-3 py-2">
    <li class="flex min-h-[35px] items-center border-b-[1px] border-solid border-black">id  bigint()</li>
    <li class="flex min-h-[35px] items-center border-b-[1px] border-solid border-black"> sso_user_id int()</li>
    <li class="flex min-h-[35px] items-center border-b-[1px] border-solid border-black">org_id  int()</li>
    <li class="flex min-h-[35px] items-center border-b-[1px] border-solid border-black"> created_at timestamp()</li>
    <li class="flex min-h-[35px] items-center border-b-[1px] border-solid border-black">updated_at timestamp()</li>
    
    <div class="flex min-h-[35px] items-center space-x-4 border-b-[1px] border-solid border-black"> 
      <div class="flex"> names attribut </div>
      <div class="flex">
        <label for="pk">PK</label><input class="mx-1" type="checkbox" name="pk" id="">
      </div>
      <div class="flex">
        <label for="ai">AI</label><input class="mx-1" type="checkbox" name="ai" id="">
      </div>
      <div class="flex">
        <label for="fk">FK</label>
        <Select class="mx-1" name="fk" >
          <option disabled  value="id_1"> none</option>
          <option  value="id_1"> id1</option>
          <option  value="id_2"> id2 </option>
        </Select> 
      </div>
      <div class="flex">
        <label for="t">type</label>
        <Select class="mx-1" name="t" >
          <option disabled  value="id_1"> none</option>
          <option  value="int"> int</option>bigint
          <option  value="bigint"> bigint</option>
          <option  value="varchar(255)"> varchar</option>
          <option  value="id_3"> float</option>
          <option  value="timestamp"> Date</option>
        </Select> 
      </div>
    </div>

    <div :v-for="(index,v) in tables">
       
    </div>
    
    <div @click="addAttribute" class="flex min-h-[25px] cursor-pointer items-center justify-center text-base font-semibold">
      add atribute +
    </div>
  
  </ul>

  <div
    class="font- flex h-[15%] cursor-pointer items-center justify-center rounded-b-xl border-2 border-x-2 border-black bg-orange-300 text-xl font-normal">
    <router-link to="/createAttribut"> Add attribut + </router-link>
  </div>


</div> -->
        <div class="flex min-h-[400px] min-w-[400px] flex-col rounded-xl bg-transparent">
          <input v-model="tableName" type="text"
            class="flex min-h-[55px] items-center justify-center rounded-t-2xl border-2 border-solid border-black bg-slate-400 text-center outline-none">
          <ul class="flex-col border-2 border-x-2 border-black bg-lime-400 px-3 py-2">
            <!-- Attributs statiques -->
            <li class="flex min-h-[35px] items-center border-b-[1px] border-solid border-black">id bigint()</li>
            <li class="flex min-h-[35px] items-center border-b-[1px] border-solid border-black">sso_user_id int()</li>
            <li class="flex min-h-[35px] items-center border-b-[1px] border-solid border-black">org_id int()</li>
            <li class="flex min-h-[35px] items-center border-b-[1px] border-solid border-black">created_at timestamp()
            </li>
            <li class="flex min-h-[35px] items-center">updated_at timestamp()</li>

            <!-- Attributs dynamiques ajoutés -->
            <li v-for="(attribute, index) in attributes" :key="index"
              class="flex min-h-[45px] items-center border-t-[1px] border-solid border-black py-2">
              <!-- <input :value="attribute.name" :v-form="attribute.name" type="text"
  class="flex min-w-max flex-grow border-none bg-transparent decoration-transparent outline-none"> -->
              <!-- Input pour le nom de l'attribut avec largeur dynamique -->
              <input v-model="attribute.name" :style="{ width: attribute.name.length + 'ch' }"
                class="flex items-center border-none bg-transparent focus:outline-none" type="text" />

              <!-- <div class="flex">{{ attribute.name }}</div> -->
              <div class="ml-1 flex">
                <label for="pk">PK</label><input class="mx-1" type="checkbox" name="pk" v-model="attribute.pk">
              </div>
              <div class="flex">
                <label for="nn">NN</label><input class="mx-1" type="checkbox" name="nn" v-model="attribute.nn">
              </div>
              <div class="mx-1 flex">
                <label for="fk">FK</label>
                <input class="mx-1" type="checkbox" name="fk" v-model="attribute.fk">
              </div>

              <div v-if="attribute.fk" class="mx-1 flex">
                <input v-model="attribute.foreignTable" :style="{ width: attribute.foreignTable.length + 'ch' }"
                  class="flex min-w-[4px] items-center border-none bg-white focus:outline-none" type="text" />
              </div>
              
              <div class="flex">
                <label for="t">type</label>
                <select class="mx-1" name="t" v-model="attribute.type">
                  <option disabled value="">none</option>
                  <option value="int">int</option>
                  <option value="bigint">bigint</option>
                  <option value="varchar(255)">varchar</option>
                  <option value="float">float</option>
                  <option value="timestamp">Date</option>
                </select>
              </div>
              <div class="mx-1 flex items-center">
                <label for="comment">comments</label>
                <textarea id="comment_id"  rows="2" class="mx-1 w-[100%] resize-none rounded-md border-none p-1 outline-none focus:border-[#2980b9]" name="comment" v-model="attribute.comment"></textarea>
              </div>
              <!-- Bouton de suppression -->
              <div class="flex items-center">
                <button @click="removeAttribute(index)" class="text-red-500">
                  🗑️
                </button>
              </div>
              
            </li>

          </ul>
          <!-- Bouton pour ajouter un nouvel attribut -->
          <div @click="addAttribute"
            class="font- flex min-h-[55px] cursor-pointer items-center justify-center rounded-b-xl border-2 border-x-2 border-black bg-orange-300 font-semibold">
            add attribute +
          </div>


        </div>
      </div>
      <div class="flex w-[50%] items-center justify-center border-l-2 border-black px-4">
        <div class="h-full w-full"  style="position: relative;">
          <svg class="cursor-pointer" @click="copyToClipboard('sp_id')" style="position: absolute; right: 35; top: 15;" xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#334155"><path d="M360-240q-33 0-56.5-23.5T280-320v-480q0-33 23.5-56.5T360-880h360q33 0 56.5 23.5T800-800v480q0 33-23.5 56.5T720-240H360ZM200-80q-33 0-56.5-23.5T120-160v-560h80v560h440v80H200Z"/></svg>
        <div class="flex h-full rounded-lg border-[2px] border-solid border-black">
          <textarea class="h-[90%] w-[98%] rounded-md p-2 outline-none" name="code"
          id="sp_id">
          {{ spgenerateCode.spgenerateCode }}</textarea>
        </div>
          
        </div>
    
      </div>
    </div>

  </div>
</template>
<script>
import Card from "@/components/card.vue";

export default {
  name: "createTable",
  components: [Card],
  data() {
    return {
      tables: [1],
      text: '',
      tableName: "TableName",
      spgenerateCode: "",
      dbName: "",
      attributes: [],
      //table: {},
      tablesUser: {
        name: "user",
        description: "description",
        attribut: [{ title: "titre", type: "", iskey: false, foregnTable: "" }],
      },
      //attribut:{},
    };
  },
  methods: {
     transformString(str) {
    // Mettre la première lettre en minuscule et enlever le dernier caractère
    return str.charAt(0).toLowerCase() + str.slice(1, -1);
},
    addAttribute() {
      // Ajouter un nouvel attribut avec des valeurs par défaut
      this.attributes.push({
        name: `new_attribute_${this.attributes.length + 1}`,
        pk: false,
        nn: false,
        fk: false,
        foreignTable: "foreignTable",
        type: '',
        comment: ''
      });
    },
    removeAttribute(index) {
      // Supprimer l'attribut à l'index spécifié
      this.attributes.splice(index, 1);
    },
    async copyToClipboard(inputId) {
      const input = document.getElementById(inputId);
      console.log('test ok ')
      try {
        await navigator.clipboard.writeText(input.value);
        alert(`Contenu de ${inputId} copié dans le presse-papiers!`);
      } catch (err) {
        console.error('Échec de la copie : ', err);
        alert('La copie a échoué, veuillez réessayer.');
      }
    },
    generateStoredProcedure(dbName, tableName, attributes) {
      // Générer les paramètres pour les procédures
      const insertParams = attributes.map(attr => `IN ${attr.name} ${attr.type}`).join(', ');
      const insertColumns = attributes.map(attr => `\`${attr.name}\``).join(', ');
      const insertValues = attributes.map(attr => `\`${attr.name}\``).join(', ');

      const updateParams = attributes.map(attr => `IN ${attr.name} ${attr.type}`).join(', ');
      const updateColumnsValues = attributes.map(attr => `\`${attr.name}\` = ${attr.name}`).join(', ');

      // Générer les procédures stockées
      const createtable = `
 use ${dbName}
 create table ${tableName};
(
    id          bigint unsigned auto_increment comment 'id of the type of ${tableName}'
        primary key,
        ${attributes.map(attr =>
        `${attr.name}  ${attr.type}  ${attr.nn ? `not null` : `null`} comment '${attr.comment} '`
      )}
    sso_user_id int                                 null comment 'the id of the user in the sso.',
    org_id      int                                 null comment 'the id of the organization.',
    created_at  timestamp default CURRENT_TIMESTAMP  comment 'date we create the type of question',
    updated_at  timestamp default CURRENT_TIMESTAMP comment 'date we update the type of question',
    ${attributes.filter(attr => attr.fk).map(v => `constraint  ${v.name}_${this.transformString(v.foreignTable)}_id_fk  foreign key (${this.transformString(v.foreignTable)}_id) references ${v.foreignTable} (id) on update cascade on delete cascade`)} 
);

 `


      const sp_counter = `
      # routine to count all occurences of  ${tableName} table
use ${dbName}
create procedure sp_${tableName.slice(0, -1)}_count()
BEGIN
    select count(*) as total
    from ${tableName};
END;
`
      const sp_create = `
       # routine to create   ${tableName} table
   
create
   procedure sp_${this.transformString(tableName)}_create(${attributes.map(attr => `IN ${attr.name}_ ${attr.type},`)} IN ssoUserId int, IN orgId int  )
BEGIN
    INSERT INTO ${tableName}(answer, question_id, is_correct,sso_user_id, org_id)
    VALUES (${attributes.map(attr => `${attr.name}_ ,`)} ssoUserId, orgId);
    select * from ${tableName} where id = last_insert_id() limit 1;
END;

`

      const sp_list = `
            # routine to list all occurences of  ${tableName} table
    
create
     procedure sp_${this.transformString(tableName)}_list(IN currentPage int, IN perPage int, IN paginate int)
BEGIN
    DECLARE nb INT;
    if paginate = 1 then
        set nb = ((currentPage - 1) * perPage);
        SELECT *
        FROM ${tableName}
        LIMIT nb, perPage;
    else
        SELECT *
        FROM ${tableName};
    end if;
END;
`

const sp_read = `
# routine to read  on occurences of  ${tableName} table to use id 
create
     procedure sp_${this.transformString(tableName)}_read(IN id_ bigint)
BEGIN
    select *
    from  ${tableName}
    where id = id_
    limit 1;
END;
`
const sp_update =`
# routine to update   ${tableName} table to use id 
create
     procedure sp_${this.transformString(tableName)}_update(${attributes.map(attr => `IN ${attr.name}_ ${attr.type},`)} id_ int)
BEGIN
    update ${tableName}
    set ${attributes.map(attr => `${attr.name} = ${attr.name}_ ,`)}
    where id = id_;
END;
`

      console.log(createtable);
      console.log(sp_counter);
      console.log(sp_create);
      const spgenerateCode = createtable.concat(sp_counter).concat(sp_create).concat(sp_read).concat(sp_update);

      const insertProcedure = `
DELIMITER ;;
CREATE PROCEDURE \`${dbName}\`.insert_into_${tableName}(
  ${insertParams}
)
BEGIN
  INSERT INTO \`${tableName}\`(${insertColumns})
  VALUES (${insertValues});
END;;
DELIMITER ;
`;

      const updateProcedure = `
DELIMITER ;;
CREATE PROCEDURE \`${dbName}\`.update_${tableName}(
  ${updateParams},
  IN id_value BIGINT
)
BEGIN
  UPDATE \`${tableName}\`
  SET ${updateColumnsValues}
  WHERE id = id_value;
END;;
DELIMITER ;
`;

      const deleteProcedure = `
DELIMITER ;;
CREATE PROCEDURE \`${dbName}\`.delete_from_${tableName}(IN id_value BIGINT)
BEGIN
  DELETE FROM \`${tableName}\`
  WHERE id = id_value;
END;;
DELIMITER ;
`;

      const selectProcedure = `
DELIMITER ;;
CREATE PROCEDURE \`${dbName}\`.select_from_${tableName}()
BEGIN
  SELECT * FROM \`${tableName}\`;
END;;
DELIMITER ;
`;

      return {
        // createtable,
        // insertProcedure,
        // updateProcedure,
        // deleteProcedure,
        // selectProcedure,
        spgenerateCode
      };
    }

  },
  // mounted() {},
};
</script>
<style></style>


<!-- const procedures = generateStoredProcedure(dbName, tableName, attributes);

console.log(procedures.insertProcedure);
console.log(procedures.updateProcedure);
console.log(procedures.deleteProcedure);
console.log(procedures.selectProcedure); -->
