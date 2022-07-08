<template>
    <div id="sidebar">
        <avatar></avatar>
        <div class="icons">
            <router-link to="/note/1" title="笔记"><i class="iconfont icon-note"></i></router-link>
            <router-link to="/notebooks" title="笔记本"><i class="iconfont icon-notebook"></i></router-link>
            <router-link to="/trash/2" title="回收站"><i class="iconfont icon-trash"></i></router-link>
        </div>
        <div class="logout">
            <i class="iconfont icon-logout" @click="logout"></i>
        </div>
    </div>
</template>
<script>
import avatar from '@/components/Avatar'
import Auth from "@/apis/auth";
import Bus from '@/helpers/bus'
export default {
    components: {avatar},
    props:[],
    methods: {
        logout() {
            Auth.logout().then(data=>{
            this.$router.push({path:'login'})
            Bus.$emit('userInfo',{username:'未登录'})
            })
        }
    }
}  
</script>

<style scoped lang="less">
#sidebar {
    position: relative;
    width: 56px;
    text-align: center;
    background-color: #2c333c;
   
    .icons {
        margin-top: 15px;

        a {
            padding: 6px 0;
            display: block;
        }

        .router-link-active {
            background-color: #5e6266;
        }
    }

    .logout {
        position: absolute;
        width: 100%;
        bottom: 20px;
        cursor: pointer;
        text-align: center;
    }

    .iconfont {
        color: #fff;
    }
}
</style>




    