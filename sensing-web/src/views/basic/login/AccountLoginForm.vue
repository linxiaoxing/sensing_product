<template>
    <ElForm
      ref="formRef"
      label-width="0px"
      :model="formData"
      :rules="formRules"
      :disabled="isLogging"
    >
      <ElFormItem prop="account">
        <ElInput size="default" v-model="formData.account" :placeholder="t('common.login.account')" />
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
  import { isEmpty, debounce } from 'lodash-es'
  import { useTransl } from '/@/composables/core/useTransl'
  
  const formData = reactive({
    account: '',
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
  const handleLogin = debounce(() => {
    if (!formRef.value) return
  
    formRef.value.validate(async (valid) => {
      if (valid) {
        try {
          isLogging.value = true
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
    
  }, 500)
  
  // init
  handleGetImageCaptcha()
  
  /**
   * form config
   */
  const formRules = reactive<Partial<Record<string, FormItemRule | FormItemRule[]>>>({
    account: [
      {
        required: true,
        trigger: 'blur',
        type: 'string',
        min: 4,
        message: () => {
          if (isEmpty(formData.account)) {
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