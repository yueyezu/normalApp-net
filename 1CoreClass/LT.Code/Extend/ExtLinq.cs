/**
* Title: Linq操作的扩展方法
* Author: other
* Date: long long ago
* Desp: 
*/
using System;
using System.Linq;
using System.Linq.Expressions;

namespace LT.Code
{
    public static partial class ExtLinq
    {
        public static Expression Property(this Expression expression, string propertyName)
        {
            return Expression.Property(expression, propertyName);
        }

        public static Expression AndAlso(this Expression left, Expression right)
        {
            return Expression.AndAlso(left, right);
        }

        public static Expression Call(this Expression instance, string methodName, params Expression[] arguments)
        {
            return Expression.Call(instance, instance.Type.GetMethod(methodName), arguments);
        }

        public static Expression GreaterThan(this Expression left, Expression right)
        {
            return Expression.GreaterThan(left, right);
        }

        //将指定的语句转化为lambda表达式
        public static Expression<T> ToLambda<T>(this Expression body, params  ParameterExpression[] parameters)
        {
            return Expression.Lambda<T>(body, parameters);
        }

        /// <summary>
        /// 将lambda表达式转化为断言表达式
        /// </summary>
        /// <typeparam name="T">对象类型</typeparam>
        /// <param name="source">lambda表达式</param>
        /// <returns></returns>
        public static Predicate<T> ToPredicate<T>(this Expression<Func<T, bool>> source)
        {
            Predicate<T> result = new Predicate<T>(source.Compile());
            return result;
        }

        #region 拼接lambda表达式常用方法

        public static Expression<Func<T, bool>> True<T>()
        {
            return param => true;
        }

        public static Expression<Func<T, bool>> False<T>()
        {
            return param => false;
        }

        public static Expression<Func<T, bool>> Or<T>(this Expression<Func<T, bool>> expr1, Expression<Func<T, bool>> expr2)
        {
            var invokedExpr = Expression.Invoke(expr2, expr1.Parameters.Cast<Expression>());
            return Expression.Lambda<Func<T, bool>>(Expression.OrElse(expr1.Body, invokedExpr), expr1.Parameters);
        }

        public static Expression<Func<T, bool>> And<T>(this Expression<Func<T, bool>> expr1, Expression<Func<T, bool>> expr2)
        {
            var invokedExpr = Expression.Invoke(expr2, expr1.Parameters.Cast<Expression>());
            return Expression.Lambda<Func<T, bool>>(Expression.AndAlso(expr1.Body, invokedExpr), expr1.Parameters);
        }

        #endregion

        //TODO 注释的这段代码在4.0的框架下可以打开正常使用,主要是ExpressionVisitor在低版本中不存在
        //public static Expression<Func<T, bool>> And<T>(this Expression<Func<T, bool>> first, Expression<Func<T, bool>> second)
        //{
        //    return first.Compose(second, Expression.AndAlso);
        //}
        //public static Expression<Func<T, bool>> Or<T>(this Expression<Func<T, bool>> first, Expression<Func<T, bool>> second)
        //{
        //    return first.Compose(second, Expression.OrElse);
        //}
        //public static Expression<T> Compose<T>(this Expression<T> first, Expression<T> second, Func<Expression, Expression, Expression> merge)
        //{
        //    var map = first.Parameters
        //        .Select((f, i) => new { f, s = second.Parameters[i] })
        //        .ToDictionary(p => p.s, p => p.f);
        //    var secondBody = ParameterRebinder.ReplaceParameters(map, second.Body);
        //    return Expression.Lambda<T>(merge(first.Body, secondBody), first.Parameters);
        //}

        //private class ParameterRebinder : ExpressionVisitor
        //{
        //    readonly Dictionary<ParameterExpression, ParameterExpression> map;
        //    /// <summary>
        //    /// Initializes a new instance of the <see cref="ParameterRebinder"/> class.
        //    /// </summary>
        //    /// <param name="map">The map.</param>
        //    ParameterRebinder(Dictionary<ParameterExpression, ParameterExpression> map)
        //    {
        //        this.map = map ?? new Dictionary<ParameterExpression, ParameterExpression>();
        //    }
        //    /// <summary>
        //    /// Replaces the parameters.
        //    /// </summary>
        //    /// <param name="map">The map.</param>
        //    /// <param name="exp">The exp.</param>
        //    /// <returns>Expression</returns>
        //    public static Expression ReplaceParameters(Dictionary<ParameterExpression, ParameterExpression> map, Expression exp)
        //    {
        //        return new ParameterRebinder(map).Visit(exp);
        //    }
        //    protected override Expression VisitParameter(ParameterExpression p)
        //    {
        //        ParameterExpression replacement;

        //        if (map.TryGetValue(p, out replacement))
        //        {
        //            p = replacement;
        //        }
        //        return base.VisitParameter(p);
        //    }
        //}
    }
}
