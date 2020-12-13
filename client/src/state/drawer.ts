import { writable } from 'svelte/store';

export const isDrawerOpen = writable(false);

export function openDrawer() {
  isDrawerOpen.update((_) => true);
}

export function closeDrawer() {
  isDrawerOpen.update((_) => false);
}
