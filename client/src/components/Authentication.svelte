<script lang="ts">
  import Dialog from '@smui/dialog';
  import Button from '@smui/button';

  let authDialog;
</script>

<style>
</style>

<div>
  <Dialog bind:this={authDialog}>Testing</Dialog>
  <Button on:click={() => authDialog.open()}>Open</Button>
</div>
