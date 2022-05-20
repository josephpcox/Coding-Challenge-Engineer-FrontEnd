<template>
  <div id="app">
    <h3>Netflix Titles</h3>
    <NetflixTitles/>
  </div>
</template>

<script>
import NetflixTitles from './components/NetflixTitles.vue'

export default {
  name: 'App',
  components: {
    NetflixTitles
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
