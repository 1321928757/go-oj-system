<template>
  <div class="submit-list">
    <div class="list" v-loading="loading">
      <div class="msg title">
        <span>问题</span><span>用户</span><span>提交时间</span>
        <span style="display: flex; white-space: nowrap; align-items: center"
          >状态：

          <el-select v-model="mystatus" clearable @change="getSubmitList">
            <el-option
              :value="obj.value"
              v-for="(obj, i) in status"
              :key="i"
              :label="obj.name"
              ></el-option
            >
          </el-select>
        </span>
      </div>
      <div class="msg" v-for="item in submitList" :key="item.id">
        <span @click="toProblem(item.problem_basic)" class="name">{{
          item.problem_basic.title
        }}</span>
        <span v-if="item.user_basic">{{ item.user_basic.username }}</span>
        <span v-if="item.user_basic">{{ item.created_at }}</span>
        <span>{{ item.status == -1 ? "评测中" : item.status == 1 ? "答案正确" : item.status == 2 ? 
        "答案错误" : item.status == 3 ? "运行超时" : item.status == 4 ? "运行超内容" : item.status == 5 ? 
        "编译错误" : item.status == 6 ? "非法代码" : "未知"  }}</span>
      </div>
    </div>
    <div class="pagi">
      <el-pagination
        v-model:currentPage="currentPage"
        v-model:page-size="pageSize"
        :page-sizes="[10, 20, 50, 100]"
        layout="total,sizes, prev, pager, next"
        :total="total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      />
    </div>
  </div>
</template>
<script lang="ts" setup>
import { reactive, ref } from "@vue/reactivity";
import { Edit, Histogram, List } from "@element-plus/icons-vue";
import api from "../../api/api.js";
import { useRouter, useRoute } from "vue-router";
const loading = ref(false);
const router = useRouter();
const mystatus = ref("");
const submitList = ref([]);
const status = ref([
  {
    name: "全部",
    value: 0
  },
  {
    name: "答案正确",
    value: 1
  },
  {
    name: "答案错误",
    value: 2
  },
  {
    name: "运行超时",
    value: 3
  },
  {
    name: "运行超内存",
    value: 4
  },
  {
    name: "编译错误",
    value: 5
  },
  {
    name: "非法代码",
    value: 6
  },
  {
    name: "评测中",
    value: -1
  },
]);

const route = useRoute();
const pageSize = ref(10);
const currentPage = ref(1);
const total = ref(0);

const handleSizeChange = (val: number) => {
  getSubmitList();
};
const handleCurrentChange = (val: number) => {
  getSubmitList();
};

const getSubmitList = () => {
  loading.value = true;
  api
    .getSubmitList({
      problem_identity: route.query.identity,
      pageSize: pageSize.value,
      page: currentPage.value,
      status: mystatus.value,
    })
    .then((res) => {
      loading.value = false;
      if (res && res.data) {
        submitList.value = res.data.data.page_list;
        total.value = res.data.data.count;
      }
      console.log(res);
    });
};
getSubmitList();
const toProblem = (detail: any) => {
  router.push({
    path: "/questionDetail",
    query: detail,
  });
};
</script>
<style scoped lang="scss">
.submit-list {
  height: 100%;
  display: flex;
  justify-content: space-between;
  flex-direction: column;
}
.list {
  flex: 1;
  overflow: auto;
}
.pagi {
  text-align: center;
  display: flex;
  justify-content: center;
  padding: 10px 0;
  border-top: 1px solid #eee;
}
.item {
  // padding: 20px;

  display: flex;
  justify-content: space-between;
  align-items: center;
}
.msg {
  font-size: 14px;
  padding: 20px;
  display: flex;
  color: #999;
  border-bottom: 1px solid #eee;

  span:nth-child(1) {
    width: 50%;
  }
  span:nth-child(2) {
    width: 10%;
  }
  span:nth-child(3) {
    width: 20%;
  }
  span:nth-child(4) {
    width: 20%;
  }
  &.title {
    border-bottom: 1px solid #0087bf;
    border-top: 1px solid #0087bf;
    // color: white;
    align-items: center;
  }
  .name {
    color: skyblue;
    cursor: pointer;
  }
}
</style>
