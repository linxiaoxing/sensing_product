<script lang="ts">
  import { defineComponent, toRefs, ref, unref } from 'vue';
 
 const props = {
    /**
     * class style prefix
     */
    prefixCls: { type: String, default: prefixCls },
  };

  export default defineComponent({
    name: 'AppProvider',
    inheritAttrs: false,
    props,
    setup(props, { slots}) {
      const isMobile = ref(false);
      const isSetState = ref(false);

       return () => slots.default?.();

    }
  });
  </script>