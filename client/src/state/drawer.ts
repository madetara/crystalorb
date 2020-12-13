import { writable } from 'svelte/store';

export const isDrawerOpen = writable(false);

export function openDrawer() {
  isDrawerOpen.update(() => true);
}

export function closeDrawer() {
  isDrawerOpen.update(() => false);
}
