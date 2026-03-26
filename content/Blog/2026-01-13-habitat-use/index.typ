#import "../index.typ": template, tufted
#show: template

= Habitat使用踩雷，写在完成毕业设计的途中


Habitat是一个具身智能仿真平台，由facebook开发，官网上给出的安装教程存在一定的坑。


1.报错#link("https://github.com/facebookresearch/habitat-lab/issues/2100")[error]

上面的issue给出了安装过程中可能遇到的问题（缺失数据集）

2.测试程序

```python
import habitat
from habitat.sims.habitat_simulator.actions import HabitatSimActions
import cv2


FORWARD_KEY="w"
LEFT_KEY="a"
RIGHT_KEY="d"
FINISH="f"


def transform_rgb_bgr(image):
    return image[:, :, [2, 1, 0]]


def example():
    env = habitat.Env(
        config=habitat.get_config("benchmark/nav/pointnav/pointnav_habitat_test.yaml")
    )

    print("Environment creation successful")
    observations = env.reset()
    print("Destination, distance: {:3f}, theta(radians): {:.2f}".format(
        observations["pointgoal_with_gps_compass"][0],
        observations["pointgoal_with_gps_compass"][1]))
    cv2.imshow("RGB", transform_rgb_bgr(observations["rgb"]))

    print("Agent stepping around inside environment.")

    count_steps = 0
    while not env.episode_over:
        keystroke = cv2.waitKey(0)

        if keystroke == ord(FORWARD_KEY):
            action = HabitatSimActions.move_forward
            print("action: FORWARD")
        elif keystroke == ord(LEFT_KEY):
            action = HabitatSimActions.turn_left
            print("action: LEFT")
        elif keystroke == ord(RIGHT_KEY):
            action = HabitatSimActions.turn_right
            print("action: RIGHT")
        elif keystroke == ord(FINISH):
            action = HabitatSimActions.stop
            print("action: FINISH")
        else:
            print("INVALID KEY")
            continue

        observations = env.step(action)
        count_steps += 1

        print("Destination, distance: {:3f}, theta(radians): {:.2f}".format(
            observations["pointgoal_with_gps_compass"][0],
            observations["pointgoal_with_gps_compass"][1]))
        cv2.imshow("RGB", transform_rgb_bgr(observations["rgb"]))

    print("Episode finished after {} steps.".format(count_steps))

    if (
        action == HabitatSimActions.stop
        and observations["pointgoal_with_gps_compass"][0] < 0.2
    ):
        print("you successfully navigated to destination point")
    else:
        print("your navigation was unsuccessful")


if __name__ == "__main__":
    example()
```

运行上述代码将在环境中初始化一个智能体，你可以使用 W、A、D、F 键在环境中移动。在终端上会打印出以极坐标格式表示的目标向量，包括目标距离和目标角度。当你距离目标 0.2 米以内时，可以按 F 键执行 `stop` 操作，成功完成回合。如果你的最终目标距离为 0 或你在环境中花费超过 500 步，你的回合将失败。



Replica和ReplicaCAD数据集 前者是Replica 数据集是一个包含多种室内空间高质量重建的数据集。每个重建都具有干净密集的几何结构、高分辨率和高动态范围纹理、玻璃和镜面信息、平面分割以及语义类别和实例分割。

#link("https://raw.githubusercontent.com/facebookresearch/Replica-Dataset/refs/heads/main/assets/ReplicaModalities.png")

ReplicaCAD 数据集是对 Replica 数据集中扫描的“FRL 公寓”变体的艺术家再创作。该数据集旨在用于 Habitat 模拟器，用于具身家庭交互任务，如物体重新排列。做了建模实体。

When visiting a zoo or watching nature documentaries, it's easy to use "monkey" and "ape" interchangeably.#footnote[Both monkeys and apes belong to the order Primates, which includes over 500 species worldwide.] However, these terms describe two distinct groups of primates with fundamental differences.

// #tufted.margin-note(
//   image("imgs/gorilla.webp"),
// )

== The Tail Tells the Tale

The most obvious distinguishing feature is the tail. Monkeys have tails—sometimes long and prehensile, sometimes short and stubby—but they always have them.#footnote[Spider monkeys have prehensile tails so strong they can support their entire body weight while hanging.] Apes, on the other hand, have no tails at all. If you see a primate swinging through trees with a tail, it's definitely a monkey.

== Size and Intelligence

Apes are generally larger and more intelligent than monkeys. The great apes—gorillas, chimpanzees, bonobos, and orangutans—can weigh hundreds of pounds and possess remarkable cognitive abilities.#footnote[Koko the gorilla reportedly understood over 1,000 signs in American Sign Language and 2,000 spoken English words.] They can use tools, solve complex problems, and even learn sign language. Gibbons and siamangs, the lesser apes, are smaller but still lack tails and share many characteristics with their larger cousins.

Monkeys, while certainly clever, don't typically demonstrate the same level of problem-solving capability. They're also generally smaller, though some species like baboons can be quite large.

== Evolutionary Relationships

From an evolutionary perspective, apes are more closely related to humans than monkeys are. Humans share about 98% of our DNA with chimpanzees and bonobos.#footnote[The human-chimp lineage split from our common ancestor approximately 6-7 million years ago.] This close relationship is reflected in apes' more upright posture, broader chests, and more flexible shoulder joints compared to monkeys.

Apes also tend to be more social and form complex family structures. Their longer lifespans and extended childhoods allow for greater learning and cultural transmission between generations.

Understanding these differences helps us appreciate the diversity of primate life and our own place in the evolutionary tree.
