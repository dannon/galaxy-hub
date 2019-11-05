<template>
  <Layout>
    <h1>{{ $context.title }}</h1>
    <div v-html="$context.content"></div>
  </Layout>
</template>