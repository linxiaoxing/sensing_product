<template>
  <ElForm
    ref="formRef"
    label-width="0px"
    :model="formData"
    :rules="formRules"
    :disabled="isLogging"
  >
    <ElFormItem prop="account">
      <ElInput size="default" v-model="formData.email" :placeholder="t('common.login.account')" />
    </ElFormItem>
    <ElFormItem prop="password">
      <ElInput
        size="default"
        v-model="formData.password"
        :placeholder="t('common.login.passwd')"
        show-password
        type="password"
      />
    </ElFormItem>
    <ElFormItem prop="verifyCode">
      <div class="w-full relative flex">
        <ElInput
          size="default"
          class="flex-1"
          v-model="formData.verifyCode"
          :placeholder="t('common.login.captcha')"
          @keyup.enter="handleLogin"
        />
        <div class="h-8 w-20 ml-2 cursor-pointer select-none" @click="handleGetImageCaptcha">
          <ElImage
            class="w-full h-full"
            style="background-color: var(--el-fill-color-dark)"
            :src="captchaData"
            fit="fill"
          />
        </div>
      </div>
    </ElFormItem>
    <ElFormItem>
      <ElButton
        size="default"
        :loading="isLogging"
        class="w-full mt-3"
        type="primary"
        @click="handleLogin"
      >
        {{ t('common.login.signin') }}
      </ElButton>
    </ElFormItem>
  </ElForm>
</template>

<script setup lang="ts">
import type { ElForm, FormItemRule } from 'element-plus'

import { reactive, ref } from 'vue'
import { useRoute } from 'vue-router'
import { isEmpty, debounce } from 'lodash-es'
import { getImageCaptcha, userLogin } from '/@/api/basic'
import { useUserStore } from '/@/stores/modules/user'
import { PageEnum } from '/@/enums/pageEnum'
import { useGo } from '/@/composables/web/useGo'
import { useTransl } from '/@/composables/core/useTransl'

const formData = reactive({
  email: '',
  password: '',
  verifyCode: '',
  captchaId: '',
})

const { t } = useTransl()

/**
 * login
 */
const isLogging = ref(false)
type FormInstance = InstanceType<typeof ElForm>
const formRef = ref<FormInstance>()
const userStore = useUserStore()
const go = useGo()
const $route = useRoute()
const handleLogin = debounce(() => {
  if (!formRef.value) return

  formRef.value.validate(async (valid) => {
    if (valid) {
      try {
        isLogging.value = true
        const data = await userLogin(formData)
        if (data && !isEmpty(data.token)) {
          // logging
          userStore.setToken(data.token)

          if ($route.query.redirect) {
            go($route.query.redirect as string, true)
          } else {
            go(PageEnum.Root, true)
          }
        }
      } catch (err) {
        // nothing to do
      } finally {
        isLogging.value = false
      }
    } else {
      return false
    }
  })
}, 500)

/**
 * get image captcha
 */
const captchaData = ref('')
const handleGetImageCaptcha = debounce(async () => {
  try {
    //const { captchaId, verifyCode } = await getImageCaptcha()
    formData.captchaId = "data:image/png;base64,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"
    captchaData.value = "data:image/png;base64,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"
    // 清空文本
    formData.verifyCode = ''
  } catch (err) {}
}, 500)

// init
handleGetImageCaptcha()

/**
 * form config
 */
const formRules = reactive<Partial<Record<string, FormItemRule | FormItemRule[]>>>({
  email: [
    {
      required: true,
      trigger: 'blur',
      type: 'string',
      min: 4,
      message: () => {
        if (isEmpty(formData.email)) {
          return t('component.form.enter') + t('common.login.account')
        } else {
          return t('component.form.invalid') + t('common.login.account')
        }
      },
    },
  ],
  password: [
    {
      required: true,
      trigger: 'blur',
      type: 'string',
      min: 6,
      message: () => {
        if (isEmpty(formData.password)) {
          return t('component.form.enter') + t('common.login.passwd')
        } else {
          return t('component.form.invalid') + t('common.login.passwd')
        }
      },
    },
  ],
  verifyCode: [
    {
      required: true,
      trigger: 'blur',
      type: 'string',
      min: 4,
      max: 4,
      message: () => {
        if (isEmpty(formData.verifyCode)) {
          return t('component.form.enter') + t('common.login.captcha')
        } else {
          return t('component.form.invalid') + t('common.login.captcha')
        }
      },
    },
  ],
})
</script>