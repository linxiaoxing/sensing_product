<template>
  <AppProvider>
      <RouterView />
  </AppProvider>
</template>
<script setup lang="ts">
import { AppProvider } from '/@/components/Application'
import { useTitle } from './composables/web/useTitle'
// page title
useTitle()
</script>