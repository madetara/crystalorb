<script lang="ts">
  import 'normalize.css/normalize.css';
  import TopAppBar from '@smui/top-app-bar';
  import IconButton from '@smui/icon-button';
  import Drawer, { AppContent, Content, Scrim } from '@smui/drawer';
  import List, { Item, Text } from '@smui/list';

  const prominent = true;
  const dense = false;
  const collapsed = true;

  let openDrawer = false;
</script>

<style>
  .drawer-container {
    position: relative;
    display: flex;
    overflow: hidden;
    z-index: 0;
    height: 350px;
    max-width: 600px;
  }
</style>

<div class="drawer-container">
  <Drawer variant="modal" bind:open={openDrawer}>
    <Content>
      <IconButton
        class="material-icons"
        on:click={() => (openDrawer = !openDrawer)}>
        menu
      </IconButton>
      <List>
        <Item>
          <Text>first item</Text>
        </Item>
        <Item>
          <Text>Second item</Text>
        </Item>
      </List>
    </Content>
  </Drawer>

  <Scrim />

  <AppContent class="app-content">
    <main class="main-content">
      <div class="top-app-bar-container">
        <TopAppBar variant="short" {prominent} {dense} {collapsed}>
          <div class="menu-button-container">
            <IconButton
              margin="center"
              class="material-icons"
              on:click={() => (openDrawer = !openDrawer)}>
              menu
            </IconButton>
          </div>
        </TopAppBar>
      </div>
    </main>
  </AppContent>
</div>
