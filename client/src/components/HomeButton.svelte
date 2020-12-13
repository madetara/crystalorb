<script lang="ts">
  import IconButton from '@smui/icon-button';
  import { push } from 'svelte-spa-router';
  import { isDrawerOpen, closeDrawer } from '../state/drawer';

  let drawerOpen: boolean;
  isDrawerOpen.subscribe((v) => {
    drawerOpen = v;
  });
</script>

<style>
</style>

<IconButton
  class="material-icons"
  on:click={() => {
    closeDrawer();
    push('/');
  }}
  bind:on={drawerOpen}>
  home
</IconButton>
