import React from "react"
import { Button, StyleSheet, Text, View } from "react-native"
import { usePermalink } from "../hooks/usePermalink"
import { configureEnVerify,initialize, startVerification  } from "../modules/expo-enqura"

export default function StackView2() {
  const permalink = usePermalink()
  return (
    <View style={styles.container}>
      <Text>StackView 2</Text>
      <Button title="Go Stack View 1" onPress={() => permalink.push("STACK1")} />

      <Button title="configure enverify" onPress={() => configureEnVerify()} />
      <Button title="initialize enverify" onPress={() => initialize()} />
      <Button title="start verification" onPress={() => startVerification("test")} />
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
})
