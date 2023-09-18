import { requireNativeViewManager } from 'expo-modules-core';
import * as React from 'react';

import { ExpoEnquraViewProps } from './ExpoEnqura.types';

const NativeView: React.ComponentType<ExpoEnquraViewProps> =
  requireNativeViewManager('ExpoEnqura');

export default function ExpoEnquraView(props: ExpoEnquraViewProps) {
  return <NativeView {...props} />;
}
