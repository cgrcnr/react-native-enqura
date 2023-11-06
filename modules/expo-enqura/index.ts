import { NativeModulesProxy, EventEmitter, Subscription } from 'expo-modules-core';

// Import the native module. On web, it will be resolved to ExpoEnqura.web.ts
// and on native platforms to ExpoEnqura.ts
import ExpoEnquraModule from './src/ExpoEnquraModule';
import ExpoEnquraView from './src/ExpoEnquraView';
import { ChangeEventPayload, ExpoEnquraViewProps } from './src/ExpoEnqura.types';

// Get the native constant value.
export const PI = ExpoEnquraModule.PI;

export function hello(): string {
  return ExpoEnquraModule.hello();
}

export async function setValueAsync(value: string) {
  return await ExpoEnquraModule.setValueAsync(value);
}

export async function startVerification(value: string) {
  return await ExpoEnquraModule.startVerification(value);
}

const emitter = new EventEmitter(ExpoEnquraModule ?? NativeModulesProxy.ExpoEnqura);

export function addChangeListener(listener: (event: ChangeEventPayload) => void): Subscription {
  return emitter.addListener<ChangeEventPayload>('onChange', listener);
}

export { ExpoEnquraView, ExpoEnquraViewProps, ChangeEventPayload };
