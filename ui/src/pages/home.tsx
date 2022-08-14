import * as React from "react";
import { TaskCard } from "../card";

export const Home = () => {
  const tasks = [
    { name: "Task 1", completed: false },
    { name: "Task 2", completed: true },
  ];
  return (
    <div>
      <div>
        <h1>List of tasks</h1>
      </div>
      <div>
        {tasks.map((task) => (
          <div style={{ marginBottom: 5 }}>
            <div onClick={() => alert("yo")}>
              <TaskCard />
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};
