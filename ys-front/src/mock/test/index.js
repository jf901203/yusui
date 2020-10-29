import Mock from "../util";

const data = [
  {
    id: new Date().getTime() + "",
    name: "testname",
    content: "testcontent"
  }
];

Mock.get(/xboot\/test\/find/, data);
Mock.post(/xboot\/test\/save/, data);
Mock.put(/xboot\/test\/update/, data);
Mock.delete(/xboot\/test\/del/, data);
