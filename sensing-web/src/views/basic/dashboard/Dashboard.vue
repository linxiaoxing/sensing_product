<template>
  <PageWrapper :content-background="false">
    <ElCard class="px-4">
      <div class="font-semibold my-4 text-xl">您好, {{ getUsername }}, 欢迎使用管理后台!</div>
    </ElCard>
  </PageWrapper>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { PageWrapper } from '/@/components/Page'

import { useUserStore } from '/@/stores/modules/user'

const userStore = useUserStore()

const getUsername = computed(() => userStore.getUserInfo?.username)

</script>