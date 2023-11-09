import { StatusBar } from 'expo-status-bar';
import { Button, StyleSheet, Text, View } from 'react-native';
import {hello, PI, setValueAsync, startVerification, ExpoEnquraView} from './modules/expo-enqura'
import { preventAutoHideAsync, hideAsync} from 'expo-splash-screen'
import { useEffect, useState } from 'react';

preventAutoHideAsync()

export default function App() {

  const [nativeViewState, setNativeViewState] = useState(false) 
  useEffect(() => {
    setTimeout(() => {
      hideAsync()
    }, 5000);
  }, [])

  if(nativeViewState) {
    return (
      <View style={{marginTop: 250, marginLeft: 150}}>
        <ExpoEnquraView />
      </View>
    )
  }

  return (
    <View style={styles.container}>
      {/* <Text>Open up App.js to start working on your app!</Text> */}
      <StatusBar style="auto" />

      <Button title='initialize EnVerify' onPress={() => {
        setValueAsync("test")
        // const result = hello()
        //alert(result)
      }} />
      <Button title='start Verification' onPress={() => {
        startVerification("asdasd")
      }} />

    <Button title='native view' onPress={() => {
        setNativeViewState(true)
      }} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
