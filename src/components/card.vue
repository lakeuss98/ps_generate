<script>
export default {
  name: "card",
  props:{articles:[] ,title:'',descriptions:''}
};
</script>

<template>
 <div class="flex w-[200px] flex-col rounded-sm bg-slate-400">
<div class="border border-solid border-black"></div>
  <div class="flex w-full flex-col">
    <div v-for="article in articles">
        <li class=" "> {{ article.title }}</li>
    </div>
  </div>
  <div class="border border-solid border-black"></div>
<div class="flex justify-center">
    Ajouter un attribut
</div>
 </div>
</template>