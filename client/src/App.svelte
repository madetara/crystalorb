<script lang="ts">
  import 'normalize.css/normalize.css';
  import TopAppBar, { Row, Section } from '@smui/top-app-bar';
  import IconButton from '@smui/icon-button';
  import Drawer, { AppContent, Content, Scrim, Header } from '@smui/drawer';
  import List, { Item, Text } from '@smui/list';
  import Router, { push } from 'svelte-spa-router';

  import { Routes as routes } from './routes';
  import { isDrawerOpen, closeDrawer, openDrawer } from './state/drawer';
  import HomeButton from './components/HomeButton.svelte';

  const prominent = false;
  const dense = false;
  const collapsed = true;

  let drawerOpen: boolean;
  isDrawerOpen.subscribe((v) => {
    drawerOpen = v;
  });
</script>

<style>
  .drawer-container {
    position: relative;
    display: flex;
    overflow: hidden;
    z-index: 0;
    height: 150px;
    max-width: 600px;
  }

  .drawer-buttons-container {
    margin-top: 3px;
    margin-left: 3px;
    margin-right: 3px;
    display: flex;
    justify-content: space-between;
  }
</style>

<div class="drawer-container">
  <Drawer variant="modal" bind:open={drawerOpen}>
    <Content>
      <div class="drawer-buttons-container">
        <IconButton class="material-icons" on:click={closeDrawer}>
          menu
        </IconButton>
        <HomeButton />
      </div>
      <Header>
        <IconButton
          class="material-icons"
          on:click={() => {
            closeDrawer();
            push('/signin');
          }}>
          login
        </IconButton>
      </Header>
      <List>
        <Item
          on:click={() => {
            closeDrawer();
            push('/map/new');
          }}>
          <Text>Create new map</Text>
        </Item>
      </List>
    </Content>
  </Drawer>

  <Scrim
    on:click={() => {
      closeDrawer();
    }} />

  <AppContent class="app-content">
    <main class="main-content">
      <div class="top-app-bar-container">
        <TopAppBar variant="short" {prominent} {dense} {collapsed}>
          <Row>
            <div class="menu-button-container">
              <Section>
                <IconButton
                  margin="center"
                  class="material-icons"
                  on:click={openDrawer}>
                  menu
                </IconButton>
              </Section>
            </div>
            <Section align="end" toolbar>
              <HomeButton />
            </Section>
          </Row>
        </TopAppBar>
      </div>

      <Router {routes} />
    </main>
  </AppContent>
</div>
