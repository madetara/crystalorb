import Home from './components/Home.svelte';
import SignIn from './components/SignIn.svelte';
import MapCreator from './components/MapCreator.svelte';

export const Routes = {
  '/': Home,
  '/signin': SignIn,
  '/map/new': MapCreator,
};
